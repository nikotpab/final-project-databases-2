CREATE OR REPLACE FUNCTION fn_control_aforo_escenario()
RETURNS TRIGGER AS $$
DECLARE
    v_capacidad_max SMALLINT;
    v_boletas_vendidas INT;
END;
$$ LANGUAGE plpgsql;

-- Nota: Como BOLETA se inserta primero y COMPRA hereda la FK, 
-- controlamos el aforo directamente al emitir la BOLETA.
CREATE OR REPLACE FUNCTION fn_control_aforo_escenario()
RETURNS TRIGGER AS $$
DECLARE
    v_capacidad_max SMALLINT;
    v_boletas_vendidas INT;
BEGIN
    -- Obtener el aforo máximo del escenario asignado
    SELECT capacidad_maxima INTO v_capacidad_max
    FROM ESCENARIO
    WHERE id_escenario = NEW.escenario_id_escenario;

    -- Contar cuántas boletas ya existen para ese escenario en esa fecha específica
    SELECT COUNT(*) INTO v_boletas_vendidas
    FROM BOLETA
    WHERE escenario_id_escenario = NEW.escenario_id_escenario
      AND fecha = NEW.fecha;

    -- Si alcanzamos el límite, bloqueamos la transacción
    IF v_boletas_vendidas >= v_capacidad_max THEN
        RAISE EXCEPTION 'Aforo completo superado. El escenario % está lleno para el día % (Máx: %)', 
            NEW.escenario_id_escenario, NEW.fecha, v_capacidad_max;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_control_aforo_escenario
BEFORE INSERT ON BOLETA
FOR EACH ROW
EXECUTE FUNCTION fn_control_aforo_escenario();

CREATE OR REPLACE FUNCTION fn_validar_horario_presentacion()
RETURNS TRIGGER AS $$
BEGIN
    -- 1. Validación de consistencia: La hora de inicio debe ser cronológicamente anterior a la de fin
    IF NEW.hora_inicio >= NEW.hora_fin THEN
        RAISE EXCEPTION 'Error de fechas: La hora de inicio (%) no puede ser mayor o igual a la hora de fin (%).', 
            NEW.hora_inicio, NEW.hora_fin;
    END IF;

    -- 2. Validación de solapamiento: Evitar que dos artistas compartan el mismo escenario al mismo tiempo
    IF EXISTS (
        SELECT 1 
        FROM PRESENTACION
        WHERE escenario_id_escenario = NEW.escenario_id_escenario
          AND id_presentacion != NEW.id_presentacion -- Permite actualizaciones sobre el mismo registro
          AND (
              (NEW.hora_inicio >= hora_inicio AND NEW.hora_inicio < hora_fin) OR
              (NEW.hora_fin > hora_inicio AND NEW.hora_fin <= hora_fin) OR
              (NEW.hora_inicio <= hora_inicio AND NEW.hora_fin >= hora_fin)
          )
    ) THEN
        RAISE EXCEPTION 'Conflicto de agenda: El escenario % ya tiene un artista asignado que se solapa con el horario solicitado ( % - % ).', 
            NEW.escenario_id_escenario, NEW.hora_inicio, NEW.hora_fin;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_validar_horario_presentacion
BEFORE INSERT OR UPDATE ON PRESENTACION
FOR EACH ROW
EXECUTE FUNCTION fn_validar_horario_presentacion();