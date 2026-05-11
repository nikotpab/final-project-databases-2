----------------------------
--creado: 10/05/2026
--autor: Equipo Festival Musical
--Triggers postgreSQL
-----------------------

--validar aforo escenario antes insertar una boleta
CREATE OR REPLACE FUNCTION fn_validar_aforo()
RETURNS TRIGGER AS $$
DECLARE
    v_capacidad INTEGER;
    v_boletas_vendidas INTEGER;
BEGIN
    SELECT e.capacidad_maxima INTO v_capacidad
    FROM PRESENTACION p
    JOIN ESCENARIO e ON p.ESCENARIO_id_escenario = e.id_escenario
    WHERE p.id_presentacion = NEW.PRESENTACION_id_presentacion;
    SELECT COUNT(*) INTO v_boletas_vendidas
    FROM BOLETA



    WHERE PRESENTACION_id_presentacion = NEW.PRESENTACION_id_presentacion;
    IF v_boletas_vendidas >= v_capacidad THEN
        RAISE EXCEPTION 'No hay cupo disponible. Aforo máximo: % personas', v_capacidad;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_validar_aforo
    BEFORE INSERT ON BOLETA
    FOR EACH ROW
    EXECUTE FUNCTION fn_validar_aforo();



--auditoria cambios en las presentaciones
CREATE TABLE IF NOT EXISTS AUDITORIA_PRESENTACION (
    id_auditoria SERIAL PRIMARY KEY,
    id_presentacion INTEGER,
    campo_modificado VARCHAR(50),
    valor_anterior TEXT,
    valor_nuevo TEXT,
    usuario VARCHAR(50),
    fecha_modificacion TIMESTAMP
);

CREATE OR REPLACE FUNCTION fn_auditoria_presentacion()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.fecha IS DISTINCT FROM NEW.fecha THEN
        INSERT INTO AUDITORIA_PRESENTACION (id_presentacion, campo_modificado, valor_anterior, valor_nuevo, usuario, fecha_modificacion)
        VALUES (OLD.id_presentacion, 'FECHA', OLD.fecha::TEXT, NEW.fecha::TEXT, CURRENT_USER, CURRENT_TIMESTAMP);
    END IF;

    IF OLD.hora_inicio IS DISTINCT FROM NEW.hora_inicio OR OLD.hora_fin IS DISTINCT FROM NEW.hora_fin THEN
        INSERT INTO AUDITORIA_PRESENTACION (id_presentacion, campo_modificado, valor_anterior, valor_nuevo, usuario, fecha_modificacion)
        VALUES (OLD.id_presentacion, 'HORARIO', 
                OLD.hora_inicio::TEXT || ' - ' || OLD.hora_fin::TEXT, 
                NEW.hora_inicio::TEXT || ' - ' || NEW.hora_fin::TEXT, 
                CURRENT_USER, CURRENT_TIMESTAMP);
    END IF;

    IF OLD.ESCENARIO_id_escenario IS DISTINCT FROM NEW.ESCENARIO_id_escenario THEN
        INSERT INTO AUDITORIA_PRESENTACION (id_presentacion, campo_modificado, valor_anterior, valor_nuevo, usuario, fecha_modificacion)
        VALUES (OLD.id_presentacion, 'ESCENARIO', 
                OLD.ESCENARIO_id_escenario::TEXT, 
                NEW.ESCENARIO_id_escenario::TEXT, 
                CURRENT_USER, CURRENT_TIMESTAMP);
    END IF;
        IF OLD.ARTISTA_id_artista IS DISTINCT FROM NEW.ARTISTA_id_artista THEN
        INSERT INTO AUDITORIA_PRESENTACION (id_presentacion, campo_modificado, valor_anterior, valor_nuevo, usuario, fecha_modificacion)
        VALUES (OLD.id_presentacion, 'ARTISTA', 
                OLD.ARTISTA_id_artista::TEXT, 
                NEW.ARTISTA_id_artista::TEXT, 
                CURRENT_USER, CURRENT_TIMESTAMP);
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_auditar_presentacion
    AFTER UPDATE ON PRESENTACION
    FOR EACH ROW
    EXECUTE FUNCTION fn_auditar_presentacion();



-- evitar inconsistencia de horario de artista
CREATE OR REPLACE FUNCTION fn_validar_solapamiento_artista()
RETURNS TRIGGER AS $$
DECLARE
    v_conflicto INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_conflicto
    FROM PRESENTACION
    WHERE ARTISTA_id_artista = NEW.ARTISTA_id_artista
      AND id_presentacion != COALESCE(NEW.id_presentacion, -1)
      AND (
          (NEW.hora_inicio, NEW.hora_fin) OVERLAPS (hora_inicio, hora_fin)
      );

    IF v_conflicto > 0 THEN
        RAISE EXCEPTION 'El artista ya tiene otra presentación programada en ese horario';
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_validar_solapamiento_artista
    BEFORE INSERT OR UPDATE ON PRESENTACION
    FOR EACH ROW
    EXECUTE FUNCTION fn_validar_solapamiento_artista();



--evitar que se elimine artista con presentaciones programadas
CREATE OR REPLACE FUNCTION fn_bloquear_eliminar_artista()
RETURNS TRIGGER AS $$
DECLARE
    v_presentaciones_futuras INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_presentaciones_futuras
    FROM PRESENTACION
    WHERE ARTISTA_id_artista = OLD.id_artista
      AND fecha >= CURRENT_DATE;

    IF v_presentaciones_futuras > 0 THEN
        RAISE EXCEPTION 'No se puede eliminar el artista. Tiene % presentación(es) futura(s) programada(s)', 
                        v_presentaciones_futuras;
    END IF;
    
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_bloquear_eliminar_artista
    BEFORE DELETE ON ARTISTA
    FOR EACH ROW
    EXECUTE FUNCTION fn_bloquear_eliminar_artista();


--validar inconsistencia de horarios de presentacion (no inicie despues de que termine y
-- que no inicie antes de la fecha actual)
CREATE OR REPLACE FUNCTION fn_validar_horario_presentacion()
RETURNS TRIGGER AS $$
BEGIN
    -- Validar que hora_inicio sea menor que hora_fin
    IF NEW.hora_inicio >= NEW.hora_fin THEN
        RAISE EXCEPTION 'lla hora de inicio debe ser menor que la hora de fin';
    END IF;
    
    -- Validar que la presentación no sea en el pasado
    IF NEW.fecha < CURRENT_DATE THEN
        RAISE EXCEPTION 'no se puede programar una presentación antes de la fecha actual';
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_validar_horario_presentacion
    BEFORE INSERT OR UPDATE ON PRESENTACION
    FOR EACH ROW
    EXECUTE FUNCTION fn_validar_horario_presentacion();