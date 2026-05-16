SELECT 
    e.nombre AS escenario,
    COUNT(b.id_boleta) AS cantidad_boletas_vendidas,
    SUM(c.total) AS total_recaudado
FROM ESCENARIO e
INNER JOIN BOLETA b ON e.id_escenario = b.escenario_id_escenario
INNER JOIN COMPRA c ON b.id_boleta = c.boleta_id_boleta
GROUP BY e.nombre
ORDER BY total_recaudado DESC;

SELECT 
    p.fecha AS fecha_presentacion,
    p.hora_inicio::time AS hora,
    a.nombre AS artista,
    e.nombre AS escenario,
    co.monto AS inversion_contrato
FROM PRESENTACION p
INNER JOIN ARTISTA a ON p.artista_id_artista = a.id_artista
INNER JOIN ESCENARIO e ON p.escenario_id_escenario = e.id_escenario
INNER JOIN CONTRATO co ON a.id_artista = co.artista_id_artista
ORDER BY p.fecha ASC, p.hora_inicio ASC, co.monto DESC;

SELECT 
    tb.tipo AS tipo_boleta,
    COUNT(c.id_compra) AS transacciones,
    SUM(c.total) AS ingresos_por_tipo,
    ROUND(
        (SUM(c.total) / (SELECT SUM(total) FROM COMPRA)) * 100, 
        2
    ) AS porcentaje_del_total
FROM TIPO_BOLETA tb
INNER JOIN BOLETA b ON tb.id_tipo_boleta = b.tipo_boleta_id_tipo_boleta
INNER JOIN COMPRA c ON b.id_boleta = c.boleta_id_boleta
GROUP BY tb.tipo
ORDER BY ingresos_por_tipo DESC;