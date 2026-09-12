CREATE DATABASE pizzeria_don_piccolo_SP;
USE pizzeria_don_piccolo_SP;

CREATE TABLE clientes (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
telefono VARCHAR(20) NOT NULL,
direccion VARCHAR(200) NOT NULL,
correo_electronico VARCHAR(120) UNIQUE,
fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ingredientes (
id_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL UNIQUE,
stock DECIMAL(10,2) NOT NULL DEFAULT 0,
stock_minimo DECIMAL(10,2) NOT NULL DEFAULT 0,
unidad VARCHAR(20) NOT NULL,
costo_unitario DECIMAL (10,2) NOT NULL DEFAULT 0
);

CREATE TABLE pizzas (
id_pizza INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
tamaño ENUM('pequeña', 'mediana', 'grande') NOT NULL,
precio_base DECIMAL (10,2) NOT NULL,
tipo ENUM('vegetariana', 'especial', 'clasica') NOT NULL,
disponible BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE pizza_ingrediente (
id_pizza INT NOT NULL,
id_ingrediente INT NOT NULL,
cantidad DECIMAL(10,2) NOT NULL,

PRIMARY KEY (id_pizza, id_ingrediente),

FOREIGN KEY (id_pizza)
REFERENCES pizzas(id_pizza),

FOREIGN KEY (id_ingrediente)
REFERENCES ingredientes(id_ingrediente)
);

CREATE TABLE pedidos (
id_pedido INT AUTO_INCREMENT PRIMARY KEY,
id_cliente INT NOT NULL,
fecha_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

metodo_pago ENUM('efectivo', 'tarjeta', 'nequi') NOT NULL,

estado ENUM(
'pendiente',
'en preparación',
'entregado',
'cancelado'
) NOT NULL DEFAULT 'pendiente',

costo_envio DECIMAL(10,2) NOT NULL DEFAULT 0,
iva DECIMAL(10,2) NOT NULL DEFAULT 0,
total DECIMAL(10,2) NOT NULL DEFAULT 0,

FOREIGN KEY (id_cliente)
REFERENCES clientes(id_cliente)
);

CREATE TABLE detalle_pedido (
id_detalle INT AUTO_INCREMENT PRIMARY KEY,
id_pedido INT NOT NULL,
id_pizza INT NOT NULL,
cantidad INT NOT NULL,
precio_unitario DECIMAL(10,2) NOT NULL,

FOREIGN KEY (id_pedido)
REFERENCES pedidos(id_pedido),

FOREIGN KEY (id_pizza)
REFERENCES pizzas(id_pizza)
);

CREATE TABLE repartidores (
id_repartidor INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
zona VARCHAR(80) NOT NULL,
estado ENUM('disponible', 'no disponible') NOT NULL DEFAULT 'disponible'
);

CREATE TABLE domicilios (
id_domicilio INT AUTO_INCREMENT PRIMARY KEY,
id_pedido INT NOT NULL,
id_repartidor INT NOT NULL,
zona VARCHAR(80) NOT NULL,
hora_salida DATETIME,
hora_entrega DATETIME,
distancia_km DECIMAL(8,2),
costo_envio DECIMAL(10,2) NOT NULL DEFAULT 0,

FOREIGN KEY (id_pedido)
REFERENCES pedidos(id_pedido),

FOREIGN KEY (id_repartidor)
REFERENCES repartidores(id_repartidor)
);

CREATE TABLE historial_precios (
id_historial INT AUTO_INCREMENT PRIMARY KEY,
id_pizza INT NOT NULL,
precio_anterior DECIMAL(10,2) NOT NULL,
precio_nuevo DECIMAL(10,2) NOT NULL,
fecha_cambio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

FOREIGN KEY (id_pizza)
REFERENCES pizzas(id_pizza)
);
