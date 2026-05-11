/* ======================================================
    CONSULTAS SIGNIFICATIVAS
====================================================== */
 
/*
------------------------------------------------------------
CONSULTA 1: Ranking de artistas por ingresos totales
             (JOIN multitabla + GROUP BY + agregaciones)
------------------------------------------------------------*/
SELECT
    A.nombre                            AS artista,
    A.pais,
    COUNT(DISTINCT P.id_presentacion)   AS num_presentaciones,
    COUNT(B.id_boleta)                  AS boletas_emitidas,
    SUM(C.precio)                       AS ingresos_totales
FROM ARTISTA A
JOIN PRESENTACION  P  ON P.artista_id_artista          = A.id_artista
JOIN BOLETA        B  ON B.presentacion_id_presentacion = P.id_presentacion
JOIN COMPRA        C  ON C.id_venta                    = B.compra_id_venta
GROUP BY A.id_artista, A.nombre, A.pais
ORDER BY ingresos_totales DESC;
 
 
/*
------------------------------------------------------------
CONSULTA 2: Ocupacion real vs capacidad maxima por escenario
             (subconsulta en FROM + JOIN + calculo porcentaje)
------------------------------------------------------------*/
SELECT
    E.nombre                                          AS escenario,
    E.capacidad_maxima,
    E.ubicacion,
    sub.total_asistentes,
    ROUND(
        (sub.total_asistentes::NUMERIC / E.capacidad_maxima) * 100,
        2
    )                                                 AS porcentaje_ocupacion
FROM ESCENARIO E
JOIN (
    SELECT
        P.escenario_id_escenario         AS id_escenario,
        COUNT(AP.asistente_id_asistente) AS total_asistentes
    FROM PRESENTACION P
    JOIN ASI_PRE AP ON AP.presentacion_id_presentacion = P.id_presentacion
    GROUP BY P.escenario_id_escenario
) sub ON sub.id_escenario = E.id_escenario
ORDER BY porcentaje_ocupacion DESC;
 
 
/*
------------------------------------------------------------
CONSULTA 3: Resumen de ventas por tipo de boleta y mes
             (JOIN + GROUP BY múltiple + varias agregaciones)
------------------------------------------------------------*/
SELECT
    TO_CHAR(C.fecha, 'YYYY-MM')   AS mes_compra,
    TB.tipo                        AS tipo_boleta,
    COUNT(B.id_boleta)             AS boletas_vendidas,
    SUM(DC.cantidad)               AS total_articulos,
    SUM(DC.subtotal)               AS total_recaudado,
    ROUND(AVG(C.precio), 0)        AS promedio_gasto_compra
FROM COMPRA C
JOIN BOLETA         B   ON B.compra_id_venta             = C.id_venta
JOIN TIPO_BOLETA    TB  ON TB.boleta_id_boleta            = B.id_boleta
JOIN DETALLE_COMPRA DC  ON DC.compra_id_venta             = C.id_venta
GROUP BY TO_CHAR(C.fecha, 'YYYY-MM'), TB.tipo
ORDER BY mes_compra, tipo_boleta;