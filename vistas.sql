USE pizzeria_don_piccolo_SP;

CREATE VIEW vista_resumen_pedidos_cliente AS
SELECT 
	c.id_cliente,
    c.nombre,
    c.telefono,
    COUNT(p.id_pedido) AS cantidad_pedidos,
    SUM(p.total) AS total_gastado
FROM clientes c
JOIN pedidos p
	ON c.id_cliente = p.id_cliente
GROUP BY 
	c.id_cliente,
    c.nombre,
    c.telefono;
    
SELECT * FROM vista_resumen_pedidos_cliente;

CREATE VIEW vista_rendimiento_repartidores AS
SELECT 
	r.id_repartidor,
    r.nombre,
    r.zona,
    COUNT(d.id_domicilio) AS domicilios_realizados,
    ROUND(
		AVG(
			TIMESTAMPDIFF(
				MINUTE,
                d.hora_salida,
                d.hora_entrega
			)
		),
        2
	) AS promedio_minutos_entrega
FROM repartidores r
JOIN domicilios d
	ON r.id_repartidor = d.id_repartidor
    AND d.hora_salida IS NOT NULL
    AND d.hora_entrega IS NOT NULL
GROUP BY 
	r.id_repartidor,
    r.nombre,
    r.zona;
    
SELECT * FROM vista_rendimiento_repartidores;

CREATE VIEW vista_ingredientes_bajo_stock AS
SELECT
	id_ingrediente,
    nombre,
    stock,
    stock_minimo,
    unidad,
    costo_unitario
FROM ingredientes
WHERE stock <= stock_minimo;

SELECT * FROM vista_ingredientes_bajo_stock;