USE pizzeria_don_piccolo_SP;

INSERT INTO clientes
(nombre, telefono, direccion, correo_electronico)
VALUES
('Carlos Gómez', '3001234567', 'Calle 45 #12-30', 'carlos.gomez@gmail.com'),
('María Rodríguez', '3012345678', 'Carrera 20 #34-15', 'maria.rodriguez@gmail.com'),
('Juan Pérez', '3023456789', 'Calle 60 #18-22', 'juan.perez@gmail.com'),
('Laura Martínez', '3034567890', 'Carrera 15 #40-10', 'laura.martinez@gmail.com'),
('Andrés López', '3045678901', 'Calle 30 #25-18', 'andres.lopez@gmail.com'),
('Sofía Ramírez', '3056789012', 'Carrera 28 #50-25', 'sofia.ramirez@gmail.com'),
('Diego Torres', '3067890123', 'Calle 70 #10-35', 'diego.torres@gmail.com'),
('Valentina Castro', '3078901234', 'Carrera 12 #22-40', 'valentina.castro@gmail.com');

SELECT * FROM clientes;

INSERT INTO ingredientes
(nombre, stock, stock_minimo, unidad, costo_unitario)
VALUES
('Queso mozzarella', 30.00, 5.00, 'kg', 18000.00),
('Salsa de tomate', 20.00, 4.00, 'kg', 8000.00),
('Harina de trigo', 50.00, 10.00, 'kg', 4500.00),
('Pepperoni', 15.00, 3.00, 'kg', 28000.00),
('Jamón', 18.00, 3.00, 'kg', 22000.00),
('Champiñones', 10.00, 2.00, 'kg', 14000.00),
('Pimentón', 12.00, 2.00, 'kg', 9000.00),
('Cebolla', 12.00, 2.00, 'kg', 6000.00),
('Aceitunas', 8.00, 2.00, 'kg', 16000.00),
('Piña', 10.00, 2.00, 'kg', 10000.00),
('Carne de res', 15.00, 3.00, 'kg', 26000.00),
('Pollo', 15.00, 3.00, 'kg', 18000.00),
('Tomate', 10.00, 2.00, 'kg', 7000.00),
('Albahaca', 5.00, 1.00, 'kg', 12000.00),
('Orégano', 3.00, 0.50, 'kg', 20000.00);

SELECT * FROM ingredientes;

INSERT INTO pizzas
(nombre, tamaño, precio_base, tipo, disponible)
VALUES
('Pizza Margarita', 'pequeña', 18000.00, 'vegetariana', TRUE),
('Pizza Margarita', 'mediana', 26000.00, 'vegetariana', TRUE),
('Pizza Margarita', 'grande', 34000.00, 'vegetariana', TRUE),
('Pizza Pepperoni', 'mediana', 30000.00, 'clasica', TRUE),
('Pizza Pepperoni', 'grande', 39000.00, 'clasica', TRUE),
('Pizza Hawaiana', 'mediana', 29000.00, 'clasica', TRUE),
('Pizza Hawaiana', 'grande', 38000.00, 'clasica', TRUE),
('Pizza Carnes', 'mediana', 35000.00, 'especial', TRUE),
('Pizza Carnes', 'grande', 45000.00, 'especial', TRUE),
('Pizza Vegetariana', 'grande', 36000.00, 'vegetariana', TRUE);

SELECT * FROM pizzas;

INSERT INTO pizza_ingrediente
(id_pizza, id_ingrediente, cantidad)
VALUES

-- Margarita pequeña
(1, 1, 0.150),
(1, 2, 0.080),
(1, 3, 0.200),
(1, 13, 0.050),
(1, 14, 0.010),
(1, 15, 0.005),

-- Margarita mediana
(2, 1, 0.220),
(2, 2, 0.120),
(2, 3, 0.280),
(2, 13, 0.070),
(2, 14, 0.015),
(2, 15, 0.007),

-- Margarita grande
(3, 1, 0.300),
(3, 2, 0.160),
(3, 3, 0.380),
(3, 13, 0.100),
(3, 14, 0.020),
(3, 15, 0.010),

-- Pepperoni mediana
(4, 1, 0.220),
(4, 2, 0.120),
(4, 3, 0.280),
(4, 4, 0.120),
(4, 15, 0.007),

-- Pepperoni grande
(5, 1, 0.300),
(5, 2, 0.160),
(5, 3, 0.380),
(5, 4, 0.170),
(5, 15, 0.010),

-- Hawaiana mediana
(6, 1, 0.220),
(6, 2, 0.120),
(6, 3, 0.280),
(6, 5, 0.100),
(6, 10, 0.100),
(6, 15, 0.007),

-- Hawaiana grande
(7, 1, 0.300),
(7, 2, 0.160),
(7, 3, 0.380),
(7, 5, 0.140),
(7, 10, 0.140),
(7, 15, 0.010),

-- Carnes mediana
(8, 1, 0.220),
(8, 2, 0.120),
(8, 3, 0.280),
(8, 4, 0.080),
(8, 5, 0.080),
(8, 11, 0.100),
(8, 12, 0.080),
(8, 15, 0.007),

-- Carnes grande
(9, 1, 0.300),
(9, 2, 0.160),
(9, 3, 0.380),
(9, 4, 0.110),
(9, 5, 0.110),
(9, 11, 0.140),
(9, 12, 0.110),
(9, 15, 0.010),

-- Vegetariana grande
(10, 1, 0.300),
(10, 2, 0.160),
(10, 3, 0.380),
(10, 6, 0.080),
(10, 7, 0.070),
(10, 8, 0.060),
(10, 9, 0.060),
(10, 13, 0.080),
(10, 14, 0.020),
(10, 15, 0.010);

DELETE FROM pizza_ingrediente
WHERE id_pizza > 0;

SELECT COUNT(*) AS total
FROM pizza_ingrediente;

INSERT INTO pizza_ingrediente
(id_pizza, id_ingrediente, cantidad)
VALUES

-- Margarita pequeña
(1, 1, 0.15),
(1, 2, 0.08),
(1, 3, 0.20),
(1, 13, 0.05),
(1, 14, 0.01),
(1, 15, 0.01),

-- Margarita mediana
(2, 1, 0.22),
(2, 2, 0.12),
(2, 3, 0.28),
(2, 13, 0.07),
(2, 14, 0.02),
(2, 15, 0.01),

-- Margarita grande
(3, 1, 0.30),
(3, 2, 0.16),
(3, 3, 0.38),
(3, 13, 0.10),
(3, 14, 0.02),
(3, 15, 0.01),

-- Pepperoni mediana
(4, 1, 0.22),
(4, 2, 0.12),
(4, 3, 0.28),
(4, 4, 0.12),
(4, 15, 0.01),

-- Pepperoni grande
(5, 1, 0.30),
(5, 2, 0.16),
(5, 3, 0.38),
(5, 4, 0.17),
(5, 15, 0.01),

-- Hawaiana mediana
(6, 1, 0.22),
(6, 2, 0.12),
(6, 3, 0.28),
(6, 5, 0.10),
(6, 10, 0.10),
(6, 15, 0.01),

-- Hawaiana grande
(7, 1, 0.30),
(7, 2, 0.16),
(7, 3, 0.38),
(7, 5, 0.14),
(7, 10, 0.14),
(7, 15, 0.01),

-- Carnes mediana
(8, 1, 0.22),
(8, 2, 0.12),
(8, 3, 0.28),
(8, 4, 0.08),
(8, 5, 0.08),
(8, 11, 0.10),
(8, 12, 0.08),
(8, 15, 0.01),

-- Carnes grande
(9, 1, 0.30),
(9, 2, 0.16),
(9, 3, 0.38),
(9, 4, 0.11),
(9, 5, 0.11),
(9, 11, 0.14),
(9, 12, 0.11),
(9, 15, 0.01),

-- Vegetariana grande
(10, 1, 0.30),
(10, 2, 0.16),
(10, 3, 0.38),
(10, 6, 0.08),
(10, 7, 0.07),
(10, 8, 0.06),
(10, 9, 0.06),
(10, 13, 0.08),
(10, 14, 0.02),
(10, 15, 0.01);

SELECT * FROM pizza_ingrediente;

INSERT INTO repartidores
(nombre, zona, estado)
VALUES
('Pedro Sánchez', 'Centro', 'disponible'),
('Luis Gómez', 'Norte', 'disponible'),
('Andrés Martínez', 'Sur', 'no disponible'),
('Jorge Rodríguez', 'Oriente', 'disponible'),
('Carlos Torres', 'Occidente', 'disponible'),
('Miguel Castro', 'Centro', 'no disponible');

SELECT * FROM repartidores;

INSERT INTO pedidos
(id_cliente, fecha_pedido, metodo_pago, estado, costo_envio, iva, total)
VALUES
(1, '2026-09-01 12:30:00', 'efectivo', 'entregado', 5000.00, 6840.00, 41840.00),
(2, '2026-09-01 13:15:00', 'nequi', 'entregado', 4000.00, 5520.00, 34520.00),
(3, '2026-09-02 19:20:00', 'tarjeta', 'entregado', 6000.00, 8280.00, 52280.00),
(4, '2026-09-03 20:10:00', 'nequi', 'entregado', 5000.00, 7560.00, 46560.00),
(5, '2026-09-04 18:45:00', 'efectivo', 'en preparación', 4000.00, 6840.00, 42840.00),
(6, '2026-09-05 19:30:00', 'tarjeta', 'pendiente', 5000.00, 6120.00, 39120.00),
(7, '2026-09-06 13:00:00', 'nequi', 'entregado', 4000.00, 6480.00, 40480.00),
(8, '2026-09-07 20:15:00', 'tarjeta', 'entregado', 6000.00, 8280.00, 51280.00),
(1, '2026-09-08 19:00:00', 'nequi', 'entregado', 5000.00, 7200.00, 44200.00),
(2, '2026-09-09 18:30:00', 'efectivo', 'cancelado', 4000.00, 0.00, 4000.00),
(3, '2026-09-10 19:45:00', 'tarjeta', 'en preparación', 5000.00, 7560.00, 46560.00),
(4, '2026-09-11 20:00:00', 'nequi', 'pendiente', 6000.00, 8280.00, 52280.00);

SELECT * FROM pedidos;

INSERT INTO detalle_pedido
(id_pedido, id_pizza, cantidad, precio_unitario)
VALUES

-- Pedido 1
(1, 2, 1, 26000.00),
(1, 4, 1, 30000.00),

-- Pedido 2
(2, 1, 1, 18000.00),
(2, 6, 1, 29000.00),

-- Pedido 3
(3, 5, 1, 39000.00),
(3, 8, 1, 35000.00),

-- Pedido 4
(4, 3, 1, 34000.00),
(4, 10, 1, 36000.00),

-- Pedido 5
(5, 4, 2, 30000.00),

-- Pedido 6
(6, 7, 1, 38000.00),

-- Pedido 7
(7, 2, 1, 26000.00),
(7, 6, 1, 29000.00),

-- Pedido 8
(8, 9, 1, 45000.00),

-- Pedido 9
(9, 5, 1, 39000.00),

-- Pedido 10
(10, 1, 1, 18000.00),

-- Pedido 11
(11, 8, 1, 35000.00),
(11, 10, 1, 36000.00),

-- Pedido 12
(12, 3, 1, 34000.00),
(12, 7, 1, 38000.00);

SELECT * FROM detalle_pedido;

SELECT COUNT(*) AS total_detalles
FROM detalle_pedido;

INSERT INTO domicilios
(id_pedido, id_repartidor, zona, hora_salida, hora_entrega, distancia_km, costo_envio)
VALUES
(1, 1, 'Centro', '2026-09-01 12:50:00', '2026-09-01 13:15:00', 3.20, 5000.00),
(2, 2, 'Norte', '2026-09-01 13:35:00', '2026-09-01 14:00:00', 2.50, 4000.00),
(3, 3, 'Sur', '2026-09-02 19:45:00', '2026-09-02 20:20:00', 4.80, 6000.00),
(4, 4, 'Oriente', '2026-09-03 20:35:00', '2026-09-03 21:05:00', 3.70, 5000.00),
(5, 5, 'Occidente', '2026-09-04 19:10:00', NULL, 2.90, 4000.00),
(6, 1, 'Centro', NULL, NULL, 3.40, 5000.00),
(7, 2, 'Norte', '2026-09-06 13:20:00', '2026-09-06 13:45:00', 2.20, 4000.00),
(8, 4, 'Oriente', '2026-09-07 20:35:00', '2026-09-07 21:10:00', 4.50, 6000.00),
(9, 5, 'Occidente', '2026-09-08 19:20:00', '2026-09-08 19:50:00', 3.10, 5000.00),
(10, 6, 'Centro', NULL, NULL, 2.80, 4000.00),
(11, 1, 'Centro', '2026-09-10 20:05:00', NULL, 3.60, 5000.00),
(12, 2, 'Norte', NULL, NULL, 4.20, 6000.00);

SELECT * FROM domicilios;

SELECT COUNT(*) AS total_domicilios
FROM domicilios;

INSERT INTO historial_precios
(id_pizza, precio_anterior, precio_nuevo, fecha_cambio)
VALUES
(1, 17000.00, 18000.00, '2026-08-01 10:00:00'),
(2, 24000.00, 26000.00, '2026-08-01 10:05:00'),
(3, 32000.00, 34000.00, '2026-08-02 09:30:00'),
(4, 28000.00, 30000.00, '2026-08-03 11:00:00'),
(5, 36000.00, 39000.00, '2026-08-03 11:10:00'),
(6, 27000.00, 29000.00, '2026-08-04 09:45:00'),
(7, 35000.00, 38000.00, '2026-08-04 10:00:00'),
(8, 32000.00, 35000.00, '2026-08-05 14:00:00'),
(9, 42000.00, 45000.00, '2026-08-05 14:15:00'),
(10, 33000.00, 36000.00, '2026-08-06 08:30:00');

SELECT * FROM historial_precios;