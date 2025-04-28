TALLER BASE DE DATOS SQL APLICACION E-COMMERCE 

creacion de la base de datos

CREATE DATABASE ecommerce;
USE ecommerce;
 

1. Usuarios (Creación y autenticación) 

CREATE TABLE usuarios ( 

    id_usuario INT PRIMARY KEY AUTO_INCREMENT, 
    nombre VARCHAR(100) NOT NULL, 
    email VARCHAR(100) NOT NULL UNIQUE, 
    contraseña_hash VARCHAR(255) NOT NULL, 
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP 

); 

 
2. Catálogo de Productos 

CREATE TABLE categorias ( 
    id_categoria INT PRIMARY KEY AUTO_INCREMENT, 
    nombre VARCHAR(100) NOT NULL, 
    descripcion TEXT 

); 

CREATE TABLE productos ( 

    id_producto INT PRIMARY KEY AUTO_INCREMENT, 
    nombre VARCHAR(100) NOT NULL, 
    descripcion TEXT, 
    precio DECIMAL(10,2) NOT NULL, 
    stock INT NOT NULL, 
    imagen_url VARCHAR(255), 
    id_categoria INT NOT NULL, 
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP, 

    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria) 

); 

 
3. Carrito de Compras 

CREATE TABLE carritos ( 

    id_carrito INT PRIMARY KEY AUTO_INCREMENT, 
    id_usuario INT NOT NULL, 
    fecha_actualizacion DATETIME DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) 

); 

CREATE TABLE carrito_items ( 

    id_item INT PRIMARY KEY AUTO_INCREMENT, 
    id_carrito INT NOT NULL, 
    id_producto INT NOT NULL, 
    cantidad INT NOT NULL,
    FOREIGN KEY (id_carrito) REFERENCES carritos(id_carrito), 

    FOREIGN KEY (id_producto) REFERENCES productos(id_producto) 

); 

 
4. Compras y Pagos 

CREATE TABLE ordenes ( 
    id_orden INT PRIMARY KEY AUTO_INCREMENT, 
    id_usuario INT NOT NULL, 
    total DECIMAL(10,2) NOT NULL, 
    estado VARCHAR(50), -- ejemplo: 'pendiente', 'pagado', 'enviado' 
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP, 

    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) 

); 

CREATE TABLE orden_items ( 

    id_orden_item INT PRIMARY KEY AUTO_INCREMENT, 
    id_orden INT NOT NULL, 
    id_producto INT NOT NULL, 
    cantidad INT NOT NULL, 
    precio_unitario DECIMAL(10,2), 

    FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden), 

    FOREIGN KEY (id_producto) REFERENCES productos(id_producto) 

); 

CREATE TABLE pagos ( 

    id_pago INT PRIMARY KEY AUTO_INCREMENT, 

    id_orden INT NOT NULL, 
    metodo_pago VARCHAR(50) NOT NULL, 
    estado_pago VARCHAR(50), -- ejemplo: 'exitoso', 'fallido' 
    referencia_externa VARCHAR(100), -- ID de la pasarela de pagos 
    fecha_pago DATETIME DEFAULT CURRENT_TIMESTAMP, 

    FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden) 

); 

5. SE INSERTAN LOS USUSARIOS

INSERT INTO usuarios (nombre_usuarios, correo, contraseña) VALUES
('XIMENA25´, 'xpeña@gmail.com', 'clave2341'),
('alejandro23','alerojas@gmail.com', 'clave 1234'),
('teresa21','terepolania@gmail.com', 'clave6789');



6. se insertan productos

INSERT INTO productos(nombre, descripcion, precio, stock) VALUES
('bike gw', 'aluminio rin 29',830000, 11),
('bike scott', 'aluminio rin 27.5', 780000, 20),
('bike giant', 'aluminio rin 29', 950000, 15);

7. SE INSERTAN LOS CARRITOS

INSERT INTO carrito (usuario_id, producto_id, cantidad) VALUES

(1,1,1),
(2,2,2),
(3,3,1);

8. SE INSERTAN EL VALOR DE LOS PRODUCTOS PARA COMPRAS

INSERT INTO compras(usuario_id, total) VALUES
(1, 830000),
(2, 780000),
(3, 950000);











 



