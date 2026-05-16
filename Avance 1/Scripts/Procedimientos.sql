CREATE OR REPLACE PROCEDURE pr_registrar_venta_festival(
    p_id_boleta INT,
    p_fecha DATE,
    p_id_escenario INT,
    p_id_tipo_boleta INT,
    p_id_asistente INT,
    p_id_compra VARCHAR(20),
    p_id_metodo_pago INT
) AS $$
DECLARE
    v_precio_boleta NUMERIC(15,2);
BEGIN
    -- Asignación de precios del festival basados en el tipo de boleta
    CASE p_id_tipo_boleta
        WHEN 1 THEN v_precio_boleta := 3000.00; -- Plata
        WHEN 2 THEN v_precio_boleta := 5000.00; -- Verde
        WHEN 3 THEN v_precio_boleta := 6000.00; -- Gold
        ELSE
            RAISE EXCEPTION 'Tipo de boleta no reconocido por el sistema del festival.';
    END CASE;

    -- 1. Insertar la boleta (Se dispararán los triggers de aforo y concordancia de escenario)
    INSERT INTO BOLETA (id_boleta, fecha, escenario_id_escenario, tipo_boleta_id_tipo_boleta)
    VALUES (p_id_boleta, p_fecha, p_id_escenario, p_id_tipo_boleta);

    -- 2. Insertar el registro de compra con el valor calculado de forma segura
    INSERT INTO COMPRA (boleta_id_boleta, asistente_id_asistente, id_compra, fecha, total, metodo_pago_id_metodo_pago)
    VALUES (p_id_boleta, p_id_asistente, p_id_compra, CURRENT_DATE, v_precio_boleta, p_id_metodo_pago);

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
$$ LANGUAGE plpgsql;