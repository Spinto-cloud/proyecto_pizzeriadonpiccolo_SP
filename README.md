<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/cc93ce02-086a-4e48-a0b8-599457cba948" />

# 🍕 Pizzería Don Piccolo

## 📌 Descripción del proyecto

Este proyecto consiste en el diseño y desarrollo de una base de datos
relacional para la gestión de una pizzería llamada **Don Piccolo**.

La base de datos fue desarrollada utilizando **MySQL** y permite
administrar diferentes procesos de la pizzería, como el registro de
clientes, pizzas, ingredientes, pedidos, repartidores y domicilios.

El proyecto también incluye diferentes elementos de SQL que permiten
automatizar algunas operaciones y realizar consultas sobre la
información almacenada.

Entre los elementos utilizados se encuentran:

- Tablas.
- Relaciones entre tablas.
- Claves primarias y foráneas.
- Funciones.
- Procedimientos almacenados.
- Triggers.
- Vistas.
- Consultas SQL.

El objetivo principal es aplicar los conocimientos aprendidos sobre
bases de datos relacionales y SQL en un proyecto práctico.

---

## 🎯 Objetivo general

Diseñar e implementar una base de datos relacional en MySQL que permita
administrar los principales procesos de una pizzería, desde el registro
de los clientes y productos hasta la gestión de pedidos, domicilios,
pagos e inventario.

---

## 🎯 Objetivos específicos

- Registrar la información de los clientes.
- Registrar las pizzas disponibles en la pizzería.
- Registrar los ingredientes utilizados en cada pizza.
- Controlar el inventario de ingredientes.
- Registrar los pedidos realizados por los clientes.
- Registrar los productos incluidos en cada pedido.
- Registrar los repartidores y sus zonas de trabajo.
- Registrar la información de los domicilios.
- Calcular automáticamente el total de los pedidos.
- Calcular la ganancia neta diaria.
- Actualizar automáticamente el inventario cuando se registra una pizza
  en un pedido.
- Registrar los cambios realizados en los precios de las pizzas.
- Actualizar el estado de los repartidores después de realizar una
  entrega.
- Crear vistas para facilitar la consulta de información.
- Realizar consultas utilizando diferentes funciones y comandos SQL.

## 🎯 Contenido

La base de datos está formada por 9 tablas que permiten organizar
la información del sistema.

📋 Tablas de la base de datos

1. clientes
<img width="498" height="169" alt="image" src="https://github.com/user-attachments/assets/96466a1d-d9d9-4d0a-a5ef-2ce74e348e60" />

Contiene la información básica de los clientes de la pizzería

Almacena:
- ID del cliente.
- Nombre.
- Teléfono.
- Dirección.
- Correo electrónico.
- Fecha de registro.
  
2. ingredientes
<img width="494" height="207" alt="image" src="https://github.com/user-attachments/assets/d222b34c-6abf-4c18-99dd-a89a0bbc5a9a" />

Permite controlar los ingredientes utilizados para preparar las pizzas.

Almacena:
- ID del ingrediente.
- Nombre.
- Cantidad disponible.
- Stock mínimo.
- Unidad de medida.
- Costo unitario.
  
También permite identificar los ingredientes que necesitan ser
reabastecidos.

3. pizzas
<img width="497" height="191" alt="image" src="https://github.com/user-attachments/assets/194e8d53-72c8-4a4c-a274-17030fa1896f" />

Contiene el catálogo de pizzas disponibles.

Almacena:
- ID de la pizza.
- Nombre.
- Tamaño.
- Precio base.
- Tipo de pizza.
- Disponibilidad.
  
Los tipos de pizza utilizados son:
- Vegetariana.
- Clásica.
- Especial.
  
4. pizza_ingrediente
<img width="496" height="265" alt="image" src="https://github.com/user-attachments/assets/d8b8d096-afd1-4076-aec9-211b9f8bdb0f" />

Esta tabla permite relacionar las pizzas con sus ingredientes.

Una pizza puede utilizar varios ingredientes y un ingrediente puede
ser utilizado en diferentes pizzas.

Por esta razón se utiliza una tabla intermedia para manejar la
relación entre ambas tablas.

También se almacena la cantidad utilizada de cada ingrediente.

5. pedidos
<img width="492" height="223" alt="image" src="https://github.com/user-attachments/assets/c65c2c8e-b468-4c7f-9134-abca4e1e8402" />

Contiene la información general de cada pedido realizado.

Almacena:
- ID del pedido.
- Cliente.
- Fecha y hora del pedido.
- Método de pago.
- Estado del pedido.
- Costo de envío.
- IVA.
- Total.
  
Los estados utilizados son:
- Pendiente.
- En preparación.
- Entregado.
- Cancelado.
  
6. detalle_pedido
<img width="496" height="263" alt="image" src="https://github.com/user-attachments/assets/51d5c2aa-2047-464d-977a-e20ee772ee9b" />

Esta tabla contiene las pizzas que hacen parte de cada pedido.

Permite registrar:
- ID del detalle.
- Pedido.
- Pizza.
- Cantidad.
- Precio unitario.
  
Esta tabla permite que un mismo pedido pueda contener una o varias
pizzas.

7. repartidores
<img width="497" height="130" alt="image" src="https://github.com/user-attachments/assets/e8aebbad-4003-40b4-add6-a263fb6ab983" />

Contiene la información de los repartidores encargados de realizar
los domicilios.

Almacena:
- ID del repartidor.
- Nombre.
- Zona.
- Estado.
  
El estado puede ser:
- Disponible.
- No disponible.
  
8. domicilios
<img width="529" height="206" alt="image" src="https://github.com/user-attachments/assets/8808cb1e-a4df-4cbd-a7fa-be0784d78e3c" />

Registra la información relacionada con la entrega de los pedidos.

Almacena:
- ID del domicilio.
- Pedido.
- Repartidor.
- Zona.
- Hora de salida.
- Hora de entrega.
- Distancia en kilómetros.
- Costo del envío.
  
Esta información permite conocer el tiempo aproximado que tarda cada
entrega.

9. historial_precios
<img width="497" height="194" alt="image" src="https://github.com/user-attachments/assets/a53e9fb1-14ae-4a47-a243-f093afeff58f" />

Esta tabla se utiliza para guardar los cambios realizados en los
precios de las pizzas.

Almacena:
- ID del historial.
- Pizza.
- Precio anterior.
- Precio nuevo.
- Fecha del cambio.
  
Los cambios se registran automáticamente mediante un trigger.

🔗 Relaciones principales
<img width="807" height="777" alt="diagrama_tablas" src="https://github.com/user-attachments/assets/0c44429d-525e-4716-b6a5-f938eebf04da" />

Las principales relaciones de la base de datos son:

- Un cliente puede realizar varios pedidos.
- Cada pedido pertenece a un cliente.
- Un pedido puede contener varias pizzas.
- Una pizza puede aparecer en diferentes pedidos.
- Una pizza puede tener varios ingredientes.
- Un ingrediente puede pertenecer a varias pizzas.
- Un repartidor puede realizar varios domicilios.
- Cada domicilio está relacionado con un pedido.
- Cada domicilio tiene asignado un repartidor.
  
⚙️ Funciones

En el proyecto se crearon dos funciones.

calcular_total_pedido()

<img width="362" height="117" alt="image" src="https://github.com/user-attachments/assets/e588e345-8086-47be-b689-21f55b226084" />

Esta función permite calcular el total de un pedido teniendo en cuenta
el valor de las pizzas, el costo de envío y el IVA.

Ejemplo:
SELECT calcular_total_pedido(1);

calcular_ganancia_neta_diaria()

<img width="363" height="70" alt="image" src="https://github.com/user-attachments/assets/6f7b8dd7-b684-4bc4-b362-36a54e939152" />

Esta función permite calcular la ganancia neta de un día.

Para realizar el cálculo se tienen en cuenta:
- Ventas realizadas.
- Costo de los ingredientes.
- Mano de obra.
  
Ejemplo:
SELECT calcular_ganancia_neta_diaria(
    '2026-09-01',
    80000.00
);

🔄 Procedimiento 

<img width="366" height="62" alt="image" src="https://github.com/user-attachments/assets/5ca227bf-987c-455f-9b9c-9b7c37c3183a" />

registrar_entrega()
Se creó un procedimiento para registrar la entrega de un domicilio.
Cuando se ejecuta, se registra la hora de entrega y se cambia el estado
del pedido a entregado.

Ejemplo:
CALL registrar_entrega(
    5,
    '2026-09-04 19:45:00'
);

⚡ Triggers

Se crearon tres triggers para automatizar diferentes procesos.

descontar_stock_pizza

<img width="495" height="111" alt="image" src="https://github.com/user-attachments/assets/27d0b92f-c8f3-49d6-800c-76dd6a0668c0" />

Se ejecuta cuando se agrega una pizza a un pedido.

Su función es descontar automáticamente del inventario la cantidad de
ingredientes utilizados para preparar esa pizza.

registrar_cambio_precio

<img width="410" height="73" alt="image" src="https://github.com/user-attachments/assets/c214c58a-0535-4969-89e9-39b0d5114e4d" />

Se ejecuta cuando cambia el precio base de una pizza.

El trigger registra automáticamente:
- Precio anterior.
- Precio nuevo.
- Pizza modificada.
- Fecha del cambio.
  
La información se guarda en la tabla historial_precios.

liberar_domiciliario

<img width="367" height="62" alt="image" src="https://github.com/user-attachments/assets/f7c6b047-847a-429d-8f30-b8f93e29739a" />

Se ejecuta cuando se registra la hora de entrega de un domicilio.
Después de completar la entrega, el repartidor pasa nuevamente al
estado disponible.

👁️ Vistas

Se crearon tres vistas para facilitar la consulta de información.

vista_resumen_pedidos_cliente

<img width="364" height="172" alt="image" src="https://github.com/user-attachments/assets/c869fe4f-e98e-46b1-b058-cd0b726efd6d" />

Permite consultar:
- Cliente.
- Teléfono.
- Cantidad de pedidos.
- Total gastado.
  
Ejemplo:
SELECT *
FROM vista_resumen_pedidos_cliente;

vista_rendimiento_repartidores

<img width="401" height="137" alt="image" src="https://github.com/user-attachments/assets/830f70c5-94c2-43c9-965e-2eea6c4b97a1" />

Permite consultar información sobre el trabajo de los repartidores.

Muestra:
- Repartidor.
- Zona.
- Cantidad de domicilios.
- Promedio de tiempo de entrega.
  
Ejemplo:
SELECT *
FROM vista_rendimiento_repartidores;

vista_ingredientes_bajo_stock

<img width="365" height="65" alt="image" src="https://github.com/user-attachments/assets/7603c5c8-21ba-45d6-922c-dc07bcfcc416" />

Permite consultar los ingredientes cuyo stock está igual o por debajo
del stock mínimo establecido.

Ejemplo:
SELECT *
FROM vista_ingredientes_bajo_stock;

🔎 Consultas SQL

Para comprobar el funcionamiento de la base de datos se realizaron
diferentes consultas utilizando conceptos aprendidos durante el
desarrollo del proyecto.

BETWEEN

<img width="395" height="233" alt="image" src="https://github.com/user-attachments/assets/e9b15410-f936-4b3e-83a8-681c1651e90c" />

Se utilizó para consultar pedidos realizados dentro de un rango de
fechas.

GROUP BY y COUNT

<img width="362" height="196" alt="image" src="https://github.com/user-attachments/assets/72191e68-e095-4445-b184-0fd38dfb8d0f" />

Se utilizaron para identificar las pizzas que aparecen con mayor
frecuencia en los pedidos.

JOIN

<img width="365" height="143" alt="image" src="https://github.com/user-attachments/assets/90512038-e3bb-4a64-a235-188ccc397aec" />

Se utilizaron para relacionar información de diferentes tablas, por
ejemplo, pedidos y repartidores.

AVG

<img width="365" height="134" alt="image" src="https://github.com/user-attachments/assets/fda1e294-5730-4c9d-802f-e0c8c597fea2" />

Se utilizó para calcular el promedio del tiempo de entrega por zona.

HAVING

<img width="365" height="135" alt="image" src="https://github.com/user-attachments/assets/395254a2-9eb4-4657-8065-67f9ec6230bf" />

Se utilizó para encontrar clientes cuyo gasto total supera un valor
determinado.

LIKE

<img width="502" height="134" alt="image" src="https://github.com/user-attachments/assets/3fec105d-cb6f-4457-997d-ae4180b738b9" />

Se utilizó para realizar búsquedas parciales por nombre de pizza.

Subconsulta

<img width="496" height="131" alt="image" src="https://github.com/user-attachments/assets/c356811c-1bc6-4559-8ff2-ed770888fab3" />

Se utilizó para identificar clientes frecuentes que realizaron más de
5 pedidos durante un mismo mes.

🛠️ Tecnologías utilizadas
Para desarrollar este proyecto se utilizaron:
- MySQL 8.0
- MySQL Workbench
- SQL
  
▶️ Orden para ejecutar el proyecto

Para ejecutar correctamente la base de datos se recomienda seguir este
orden:

1. Crear la base de datos y las tablas

Ejecutar primero el script que contiene la creación de las tablas.

2. Insertar los datos
   
Después de crear todas las tablas se deben insertar los datos de
clientes, ingredientes, pizzas, pedidos, etc.

3. Crear las funciones
   
Ejecutar el archivo que contiene las funciones:
calcular_total_pedido
calcular_ganancia_neta_diaria

4. Crear el procedimiento

Ejecutar el procedimiento:
registrar_entrega

5. Crear los triggers
Ejecutar los tres triggers:
descontar_stock_pizza
registrar_cambio_precio
liberar_repartidor_entrega

6. Crear las vistas

Ejecutar las tres vistas:
vista_resumen_pedidos_cliente
vista_rendimiento_repartidores
vista_ingredientes_bajo_stock

7. Ejecutar las consultas
Finalmente ejecutar las consultas SQL para comprobar la información
almacenada en la base de datos.

📁 Archivos del proyecto
Los archivos utilizados para organizar el proyecto son:

pizzeria-don-piccolo-SP/
│
├── script_tablas_DB.sql
├── inserts.sql
├── funciones.sql
├── procedimientos.sql
├── triggers.sql
├── vistas.sql
├── consultas.sql
└── README.md

📚 Aprendizajes

Durante el desarrollo de este proyecto se practicaron diferentes
conceptos relacionados con las bases de datos relacionales.

Entre ellos:
- Creación de bases de datos.
- Creación de tablas.
- Tipos de datos.
- Claves primarias.
- Claves foráneas.
- Relaciones entre tablas.
- Inserción de información.
- Consultas SQL.
- Funciones.
- Procedimientos almacenados.
- Triggers.
- Vistas.
- Uso de JOIN.
- Agrupación de información con GROUP BY.
- Uso de funciones como COUNT, SUM y AVG.
- Uso de HAVING, LIKE y BETWEEN.
- 
El proyecto permitió aplicar estos conceptos en un caso práctico de
gestión de una pizzería.

👨‍💻 Autor
Sergio Pinto K4 Campuslands
Programador Junior en formación.
Proyecto realizado como práctica de MYSQL2.

# 🗄️ Base de datos

El nombre utilizado para la base de datos es:

```sql
pizzeria_don_piccolo_SP
