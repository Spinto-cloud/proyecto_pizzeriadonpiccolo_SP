USE pizzeria_don_piccolo_SP;

SELECT
	p.id_pedido,
    c.nombre AS cliente,
    p.fecha_pedido,
    p.metodo_pago,
    p.estado,
    p.total
FROM pedidos p
JOIN clientes c 
	ON p.id_cliente = c.id_cliente
WHERE p.fecha_pedido BETWEEN
	'2026-09-01 00:00:00'
    AND
    '2026-09-11 23:59:59'
ORDER BY p.fecha_pedido;

SELECT
	p.id_pizza,
    p.nombre,
    p.tamaño,
    COUNT(dp.id_detalle) AS veces_vendida
FROM detalle_pedido dp
JOIN pizzas p
	ON dp.id_pizza = p.id_pizza
JOIN pedidos pe
	ON dp.id_pedido = pe.id_pedido
WHERE pe.estado <> 'cancelado'
GROUP BY
	p.id_pizza,
    p.nombre,
    p.tamaño
ORDER BY veces_vendida DESC;

SELECT
	r.id_repartidor,
    r.nombre AS repartidor,
    r.zona,
    COUNT(d.id_domicilio) AS pedidos_asignados
FROM repartidores r
JOIN domicilios d
	ON r.id_repartidor = d.id_repartidor
JOIN pedidos p
	ON d.id_pedido = p.id_pedido
GROUP BY
	r.id_repartidor,
    r.nombre,
    r.zona
ORDER BY pedidos_asignados DESC;

SELECT
	d.zona,
    COUNT(d.id_domicilio) AS domicilios_entregados,
    ROUND(
		AVG(
			TIMESTAMPDIFF(
				MINUTE,
                d.hora_salida,
                d.hora_entrega
			)
		),
        2
	)AS promedio_minutos_entrega
FROM domicilios d
JOIN repartidores r
	ON d.id_repartidor = r.id_repartidor
WHERE d.hora_salida IS NOT NULL
	AND d.hora_entrega IS NOT NULL
GROUP BY d.zona
ORDER BY promedio_minutos_entrega;

SELECT
	c.id_cliente,
    c.nombre,
    COUNT(p.id_pedido) AS cantidad_pedidos,
    SUM(p.total) AS total_gastado
    FROM clientes c
    JOIN pedidos p
		ON c.id_cliente = p.id_cliente
	WHERE p.estado <> 'cancelado'
    GROUP BY
		c.id_cliente,
        c.nombre
	HAVING SUM(p.total) > 60000
    ORDER BY total_gastado DESC;
    
SELECT
	id_pizza,
	nombre,
	tamaño,
	precio_base,
	tipo,
	disponible
FROM pizzas
WHERE nombre LIKE '%pepperoni%';

SELECT
	c.id_cliente,
    c.nombre,
    c.telefono
FROM clientes c
WHERE c.id_cliente IN (
	SELECT p.id_cliente
    FROM pedidos p 
    WHERE YEAR(p.fecha_pedido) = 2026
		AND MONTH(p.fecha_pedido) = 9
		AND p.estado <> 'cancelado'
	GROUP BY p.id_cliente
    HAVING COUNT(p.id_pedido) > 5
);



