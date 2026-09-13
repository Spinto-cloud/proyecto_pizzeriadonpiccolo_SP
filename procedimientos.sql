USE pizzeria_don_piccolo_SP;

DELIMITER $$

CREATE PROCEDURE registrar_entrega(
	p_id_domicilio INT,
    p_hora_entrega DATETIME
)
BEGIN
	DECLARE v_id_pedido INT;
    
    SELECT id_pedido
    INTO v_id_pedido
    FROM domicilios
    WHERE id_domicilio = p_id_domicilio;
    
    UPDATE domicilios
    SET hora_entrega = p_hora_entrega
    WHERE id_domicilio = p_id_domicilio;
    
    UPDATE pedidos
    SET estado = 'entregado'
    WHERE id_pedido = v_id_pedido;
END$$

DELIMITER ;

SELECT
	d.id_domicilio,
    d.id_pedido,
    d.hora_salida,
    d.hora_entrega,
    p.estado
FROM domicilios d
JOIN pedidos p
	ON d.id_pedido = p.id_pedido
WHERE d.id_domicilio = 5;

CALL registrar_entrega(
	5,
    '2026-09-14 19:45:00'
);


