-- ======================================================
-- PROCEDIMIENTO: Actualizar contadores de todas las presentaciones
-- Descripción: Calcula y actualiza el número real de asistentes
-- por cada presentación y registra el porcentaje de ocupación
-- ======================================================
CREATE OR REPLACE PROCEDURE pr_actualizar_contadores_aforo()
LANGUAGE plpgsql AS $$
DECLARE
    v_inicio TIMESTAMP;
    v_fin TIMESTAMP;
    v_total_actualizados INTEGER := 0;
    v_registro RECORD;
BEGIN
    v_inicio := CURRENT_TIMESTAMP;
    
    FOR v_registro IN
        SELECT 
            p.id_presentacion,
            p.ESCENARIO_id_escenario,
            e.capacidad_maxima,
            COUNT(ap.ASISTENTE_id_asistente) as asistentes_reales
        FROM PRESENTACION p
        JOIN ESCENARIO e ON p.ESCENARIO_id_escenario = e.id_escenario
        LEFT JOIN ASI_PRE ap ON p.id_presentacion = ap.PRESENTACION_id_presentacion
        WHERE p.fecha >= CURRENT_DATE 
        GROUP BY p.id_presentacion, e.capacidad_maxima
    LOOP
        UPDATE PRESENTACION
        SET asistentes_estimados = v_registro.asistentes_reales
        WHERE id_presentacion = v_registro.id_presentacion;
        
        INSERT INTO CONTROL_AFORO (
            id_control,
            PRESENTACION_id_presentacion,
            timestamp_registro,
            asistentes_actuales,
            capacidad_escenario,
            porcentaje_ocupacion
        ) VALUES (
            DEFAULT,
            v_registro.id_presentacion,
            CURRENT_TIMESTAMP,
            v_registro.asistentes_reales,
            v_registro.capacidad_maxima,
            ROUND((v_registro.asistentes_reales * 100.0) / v_registro.capacidad_maxima, 2)
        );
        
        v_total_actualizados := v_total_actualizados + 1;
    END LOOP;
    
    v_fin := CURRENT_TIMESTAMP;
    
    RAISE NOTICE '✓ PROCEDIMIENTO EJECUTADO CORRECTAMENTE';
    RAISE NOTICE ' - Presentaciones actualizadas: %', v_total_actualizados;
    RAISE NOTICE ' - Tiempo de ejecución: % ms', 
                  EXTRACT(MILLISECONDS FROM (v_fin - v_inicio));
    RAISE NOTICE ' - Registros agregados a CONTROL_AFORO: %', v_total_actualizados;
    
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'ERROR en pr_actualizar_contadores_aforo: %', SQLERRM;
END;
$$;

