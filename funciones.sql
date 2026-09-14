USE pizzeria_don_piccolo_SP;

DELIMITER $$

CREATE FUNCTION calcular_total_pedido(p_id_pedido INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE v_subtotal DECIMAL(10,2);
	DECLARE v_envio DECIMAL(10,2);
	DECLARE v_iva DECIMAL(10,2);
	DECLARE v_total DECIMAL(10,2);

	SELECT
		SUM(cantidad * precio_unitario)
	INTO v_subtotal
	FROM detalle_pedido
	WHERE id_pedido = p_id_pedido;

	SELECT
		costo_envio,
		iva
	INTO
		v_envio,
		v_iva
	FROM pedidos
	WHERE id_pedido = p_id_pedido;

	SET v_total = v_subtotal + v_envio + v_iva;

	RETURN v_total;
END$$

DELIMITER ;

SELECT calcular_total_pedido(1) AS total_pedido;

SELECT
	id_pedido,
    calcular_total_pedido(id_pedido) AS total_calculado
FROM pedidos;

UPDATE pedidos
SET total = calcular_total_pedido(id_pedido)
WHERE id_pedido > 0;

DELIMITER $$
CREATE FUNCTION calcular_ganancia_neta_diaria(
	p_fecha DATE,
    p_mano_obra DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE v_ventas DECIMAL(10,2);
    DECLARE v_costo_ingredientes DECIMAL(10,2);
    DECLARE v_ganancia DECIMAL(10,2);
    
    SELECT
		SUM(total)
	INTO v_ventas
    FROM pedidos
    WHERE DATE(fecha_pedido) = p_fecha
		AND estado = 'entregado';
        
	SELECT
		SUM(
			dp.cantidad *
            pi.cantidad *
            i.costo_unitario
		)
	INTO v_costo_ingredientes
    FROM pedidos pe
    JOIN detalle_pedido dp
		ON pe.id.pedido = dp.id_pedido
	JOIN pizza_ingrediente pi
		ON dp.id.pizza = pi.id_pizza
	JOIN ingredientes i
		ON pi.id_ingrediente = i.id_ingrediente
	WHERE DATE(pe.fecha_pedido) = p_fecha
		AND pe.estado = 'entregado';
        
	SET v_ganancia = v_ventas - v_costo_ingredientes - p_mano_obra;
    
    RETURN v_ganancia;
    
END$$

 DELIMITER ;
 
SELECT calcular_ganancia_neta_diaria(
	'2026-09-01',
	80000.00
) AS ganancia_neta;

DROP FUNCTION IF EXISTS calcular_ganancia_neta_diaria;

DELIMITER $$

CREATE FUNCTION calcular_ganancia_neta_diaria(
    p_fecha DATE,
    p_mano_obra DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_ventas DECIMAL(10,2);
    DECLARE v_costo_ingredientes DECIMAL(10,2);
    DECLARE v_ganancia DECIMAL(10,2);

    SELECT
        SUM(total)
    INTO v_ventas
    FROM pedidos
    WHERE DATE(fecha_pedido) = p_fecha
      AND estado = 'entregado';

    SELECT
        SUM(
            dp.cantidad *
            pi.cantidad *
            i.costo_unitario
        )
    INTO v_costo_ingredientes
    FROM pedidos pe
    INNER JOIN detalle_pedido dp
        ON pe.id_pedido = dp.id_pedido
    INNER JOIN pizza_ingrediente pi
        ON dp.id_pizza = pi.id_pizza
    INNER JOIN ingredientes i
        ON pi.id_ingrediente = i.id_ingrediente
    WHERE DATE(pe.fecha_pedido) = p_fecha
      AND pe.estado = 'entregado';

    SET v_ganancia =
        v_ventas
        - v_costo_ingredientes
        - p_mano_obra;

    RETURN v_ganancia;
END$$

DELIMITER ;
 
SELECT calcular_ganancia_neta_diaria(
	'2026-09-01',
    80000.00
) AS ganancia_neta;