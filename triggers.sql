USE pizzeria_don_piccolo_SP;

DELIMITER $$

CREATE TRIGGER descontar_stock_pizza
AFTER INSERT ON detalle_pedido
FOR EACH ROW
BEGIN

	UPDATE ingredientes i
    JOIN pizza_ingrediente pi
		ON i.id_ingrediente = pi.id_ingrediente
    SET i.stock = i.stock - (pi.cantidad * NEW.cantidad)
    WHERE pi.id_pizza = NEW.id_pizza;
    
END$$

DELIMITER ; 

SHOW TRIGGERS;

SELECT
	id_ingrediente,
    nombre,
    stock,
    unidad
FROM ingredientes
WHERE id_ingrediente IN (1,2,3,4);

INSERT INTO pedidos
(id_cliente, metodo_pago, estado, costo_envio, iva, total)
VALUES 
(1, 'nequi', 'pendiente', 5000.00, 0.00, 0.00);

SELECT MAX(id_pedido) AS ultimo_pedido
FROM pedidos;

INSERT INTO detalle_pedido
(id_pedido, id_pizza, cantidad, precio_unitario)
VALUES
(13, 4, 2, 30000.00);

SELECT 
	id_ingrediente,
    nombre,
    stock,
    unidad
FROM ingredientes
WHERE id_ingrediente IN (1, 2, 3, 4);

DELIMITER $$

CREATE TRIGGER registrar_cambio_precio
AFTER UPDATE ON pizzas
FOR EACH ROW
BEGIN
	IF OLD.precio_base <> NEW.precio_base THEN
    
		INSERT INTO historial_precios
        (
			id_pizza,
            precio_anterior,
            precio_nuevo
		)
        
        VALUES
        (
			NEW.id_pizza,
            OLD.precio_base,
            NEW.precio_base
		);
        
	END IF;
    
END$$

DELIMITER ;

UPDATE pizzas
SET precio_base = 37000.00
WHERE id_pizza = 10;

SELECT
	hpr.id_historial,
    p.nombre,
    p.tamaño,
    hpr.precio_anterior,
    hpr.precio_nuevo,
    hpr.fecha_cambio
FROM historial_precios hpr
JOIN pizzas p
	ON hpr.id_pizza = p.id_pizza
WHERE hpr.id_pizza = 10
ORDER BY hpr.fecha_cambio;

DELIMITER $$

CREATE TRIGGER liberar_domiciliario
AFTER UPDATE ON domicilios
FOR EACH ROW
BEGIN
	IF OLD.hora_entrega IS NULL
		AND NEW.hora_entrega IS NOT NULL THEN
        
        UPDATE repartidores
        SET estado = 'disponible'
        WHERE id_repartidor = NEW.id_repartidor;
	
    END IF;

END$$

DELIMITER ;

SELECT 
	d.id_domicilio,
    d.id_repartidor,
    d.hora_entrega,
    r.nombre,
    r.estado
FROM domicilios d
JOIN repartidores r
	ON d.id_repartidor = r.id_repartidor
WHERE d.id_domicilio =5;

UPDATE domicilios
set hora_entrega = '2026-09-04 19:45:00'
WHERE id_domicilio = 5;



