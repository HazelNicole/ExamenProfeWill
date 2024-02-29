-- Creamos la base de datos
CREATE DATABASE db_practica_will;
USE db_practica_will;


-- Creamos la tabla de clientes
CREATE TABLE tb_clientes(
cliente_id VARCHAR(50) PRIMARY KEY DEFAULT (UUID()),
nombre_cliente VARCHAR (50) NOT NULL,
apellido_cliente VARCHAR (50) NOT NULL,
telefono_cliente VARCHAR (10) NOT NULL,
direccion_cliente VARCHAR (225) NOT NULL 
);

-- Creamos la tabla de pedidos
CREATE TABLE tb_pedidos (
pedido_id VARCHAR (50) PRIMARY KEY DEFAULT (UUID()),
cliente_id VARCHAR (50),
fecha_pedido DATE DEFAULT NOW() NOT NULL,
total_pedido DECIMAL (10,2) CHECK (total_pedido >=0),
estado_pedido VARCHAR (20) NOT NULL DEFAULT 'Activo',
empleado_id VARCHAR (50)
);

-- Creamos la tabla de empleados
CREATE TABLE tb_empleados(
empleado_id VARCHAR (50) PRIMARY KEY DEFAULT (UUID()),
nombre_empleado VARCHAR(50) NOT NULL,
apellido_empleado VARCHAR (50) NOT NULL,
cargo_empleado VARCHAR (50) NOT NULL,
fecha_contratacion DATE DEFAULT NOW(),
salario_empleado DECIMAL (10,2) CHECK (salario_empleado >=0)
);

-- Creamos la tabla de detalles pedidos
CREATE TABLE tb_detalles_pedidos(
detalle_id VARCHAR (50) PRIMARY KEY DEFAULT (UUID()),
pedido_id VARCHAR (50),
producto_id VARCHAR (50),
cantidad_detalle_pedido INT NOT NULL CHECK (cantidad_detalle_pedido >=0),
precio_unitario_detalle_pedido DECIMAL(10,2) NOT NULL CHECK (precio_unitario_detalle_pedido >=0),
subtotal_detalle_pedido DECIMAL(10,2) NOT NULL CHECK (subtotal_detalle_pedido >=0)
);

-- Creamos la tabla de productos
CREATE TABLE tb_productos(
producto_id VARCHAR(50) PRIMARY KEY DEFAULT (UUID()),
nombre_producto VARCHAR (100) NOT NULL,
descripcion_producto VARCHAR (225) NOT NULL,
precio_producto DECIMAL(10,2) NOT NULL CHECK (precio_producto >=0),
existencia_producto INT NOT NULL CHECK (existencia_producto >=0)
);


-- Creamos las llaves foraneas 

ALTER TABLE tb_pedidos ADD
FOREIGN KEY (cliente_id) REFERENCES tb_clientes (cliente_id);

ALTER TABLE tb_pedidos ADD
FOREIGN KEY (empleado_id) REFERENCES tb_empleados (empleado_id);

ALTER TABLE tb_detalles_pedidos ADD
FOREIGN KEY (pedido_id) REFERENCES tb_pedidos (pedido_id);

ALTER TABLE tb_detalles_pedidos ADD
FOREIGN KEY (producto_id) REFERENCES tb_productos (producto_id);


-- Creamos las restrincciones 

ALTER TABLE tb_clientes ADD
CONSTRAINT telefono_cliente UNIQUE (telefono_cliente);



-- Creamos el trigger
 
DELIMITER //
CREATE TRIGGER descuento_existencias AFTER INSERT ON tb_detalles_pedidos
FOR EACH ROW
BEGIN
    UPDATE tb_productos
    SET existencia_producto = existencia_producto - NEW.cantidad_detalle_pedido
    WHERE producto_id = NEW.producto_id;
END //
DELIMITER ;

-- Creamos el proceso almacenado cliente

DELIMITER //
CREATE PROCEDURE insertar_cliente(
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_telefono VARCHAR(10),
    IN p_direccion VARCHAR(255)
)
BEGIN
	
	DECLARE p_cliente_id CHAR(50);
    SET p_cliente_id = UUID();

    INSERT INTO tb_clientes(cliente_id, nombre_cliente, apellido_cliente, telefono_cliente, direccion_cliente)
    VALUES (p_cliente_id, p_nombre, p_apellido, p_telefono, p_direccion);
END //
DELIMITER ;

CALL insertar_cliente('Juan', 'Perez', '1234567890', 'Calle Principal 123');
CALL insertar_cliente('Chris', 'Ponce', '1324567891', 'Calle Principal 121');
CALL insertar_cliente('Xochilt', 'Juarez', '1234567898', 'Calle Principal 122');
CALL insertar_cliente('Eduardo', 'Gutierrez', '1234567897', 'Calle Principal 124');
CALL insertar_cliente('Fernando', 'Cuchittini', '1234567896', 'Calle Principal 125');
CALL insertar_cliente('Daniel', 'Kike', '1234567895', 'Calle Principal 126');
CALL insertar_cliente('Alessandro', 'Hernandez', '1234567894', 'Calle Principal 127');
CALL insertar_cliente('Javier', 'Donatelo', '1234567893', 'Calle Principal 128');
CALL insertar_cliente('Hazel', 'Chica', '1234567892', 'Calle Principal 129');
CALL insertar_cliente('Xavi', 'Orellana', '1234567891', 'Calle Principal 120');
CALL insertar_cliente('Messi', 'Murillo', '1234567899', 'Calle Principal 111');
CALL insertar_cliente('Leo', 'Argueta', '1234567889', 'Calle Principal 112');
CALL insertar_cliente('Cristiano', 'Grandos', '1234567878', 'Calle Principal 113');
CALL insertar_cliente('Sebastian', 'Miguel', '1234567812', 'Calle Principal 143');
CALL insertar_cliente('Gabi', 'Pereza', '1234567813', 'Calle Principal 115');


SELECT * FROM tb_clientes;
-- Creamos el proceso almacenado empleados

DELIMITER //
CREATE PROCEDURE insertar_empleados(
    IN p_nombre_empleado VARCHAR(50),
    IN p_apellido_empleado VARCHAR(50),
    IN p_cargo_empleado VARCHAR(50),
    IN p_salario_empleado DECIMAL(10,2)
)
BEGIN
    
    DECLARE p_empleado_id CHAR(50);
    SET p_empleado_id = UUID();
    
    INSERT INTO tb_empleados(empleado_id, nombre_empleado, apellido_empleado, cargo_empleado, salario_empleado)
    VALUES (p_empleado_id, p_nombre_empleado, p_apellido_empleado, p_cargo_empleado, p_salario_empleado);
END //
DELIMITER ;


CALL insertar_empleados('Juan', 'Perez', 'Gerente', 5000.00);
CALL insertar_empleados('María', 'García', 'Asistente', 3000.00);
CALL insertar_empleados('Carlos', 'López', 'Analista', 3500.00);
CALL insertar_empleados('Ana', 'Martínez', 'Desarrollador', 4000.00);
CALL insertar_empleados('Pedro', 'Rodríguez', 'Diseñador', 3200.00);
CALL insertar_empleados('Laura', 'Sánchez', 'Gerente', 5500.00);
CALL insertar_empleados('Diego', 'Gómez', 'Analista', 3800.00);
CALL insertar_empleados('Sofía', 'Hernández', 'Desarrollador', 4200.00);
CALL insertar_empleados('Miguel', 'Ruiz', 'Diseñador', 3300.00);
CALL insertar_empleados('Elena', 'Díaz', 'Asistente', 3200.00);
CALL insertar_empleados('Alejandro', 'Torres', 'Gerente', 6000.00);
CALL insertar_empleados('Lucía', 'Fernández', 'Analista', 3700.00);
CALL insertar_empleados('Gabriel', 'Jiménez', 'Desarrollador', 4300.00);
CALL insertar_empleados('Marcela', 'Vargas', 'Diseñador', 3400.00);
CALL insertar_empleados('Javier', 'González', 'Asistente', 3100.00);


SELECT * FROM tb_empleados;

-- Creamos el proceso almacenado pedidos

DELIMITER //
CREATE PROCEDURE insertar_pedidos(
    IN p_total_pedido DECIMAL (10,2),
    IN p_estado_pedido VARCHAR (20),
    IN p_cliente_id VARCHAR (50),
    IN p_empleado_id VARCHAR (50)
)
BEGIN
	
	DECLARE p_pedido_id CHAR(50);
    SET p_pedido_id = UUID();

    INSERT INTO tb_pedidos(pedido_id, total_pedido, estado_pedido, cliente_id, empleado_id)
    VALUES (p_pedido_id, p_total_pedido, p_estado_pedido, p_cliente_id, p_empleado_id);
END //
DELIMITER ;

CALL insertar_pedidos(150.50, 'Pendiente', '5c7bc049-d683-11ee-b663-9c6b000a554a', '6538542c-d686-11ee-b663-9c6b000a554a');
CALL insertar_pedidos(220.75, 'En proceso', '5c7cdc02-d683-11ee-b663-9c6b000a554a', '653955d1-d686-11ee-b663-9c6b000a554a');
CALL insertar_pedidos(75.20, 'Completado', '5c7d2f8e-d683-11ee-b663-9c6b000a554a', '6539b73e-d686-11ee-b663-9c6b000a554a');
CALL insertar_pedidos(300.00, 'Pendiente', '5c7d86e1-d683-11ee-b663-9c6b000a554a', '653a221c-d686-11ee-b663-9c6b000a554a');
CALL insertar_pedidos(180.90, 'En proceso', '5c7ddc7a-d683-11ee-b663-9c6b000a554a', '653a6909-d686-11ee-b663-9c6b000a554a');
CALL insertar_pedidos(95.60, 'Pendiente', '5c7e2d4f-d683-11ee-b663-9c6b000a554a', '653abecb-d686-11ee-b663-9c6b000a554a');
CALL insertar_pedidos(500.25, 'Completado', '5c7ed81c-d683-11ee-b663-9c6b000a554a', '653b14a0-d686-11ee-b663-9c6b000a554a');
CALL insertar_pedidos(250.80, 'En proceso', '5c7f4bc7-d683-11ee-b663-9c6b000a554a', '653b98da-d686-11ee-b663-9c6b000a554a');
CALL insertar_pedidos(175.30, 'Pendiente', '5c7fc2db-d683-11ee-b663-9c6b000a554a', '653bdf42-d686-11ee-b663-9c6b000a554a');
CALL insertar_pedidos(400.60, 'Completado', '5c805eb8-d683-11ee-b663-9c6b000a554a', '653c2a90-d686-11ee-b663-9c6b000a554a');
CALL insertar_pedidos(120.40, 'Pendiente', '5c80b04e-d683-11ee-b663-9c6b000a554a', '653c6eff-d686-11ee-b663-9c6b000a554a');
CALL insertar_pedidos(350.20, 'En proceso', '5c810429-d683-11ee-b663-9c6b000a554a', '653cb31b-d686-11ee-b663-9c6b000a554a');
CALL insertar_pedidos(200.75, 'Pendiente', '5c816dbc-d683-11ee-b663-9c6b000a554a', '653cf7ff-d686-11ee-b663-9c6b000a554a');
CALL insertar_pedidos(280.90, 'Completado', '5c81d72f-d683-11ee-b663-9c6b000a554a', '653d3cfd-d686-11ee-b663-9c6b000a554a');
CALL insertar_pedidos(180.25, 'En proceso', '895bcf51-d682-11ee-b663-9c6b000a554a', '653dc78f-d686-11ee-b663-9c6b000a554a');


SELECT * FROM tb_pedidos;

-- Creamos el proceso almacenado producto

DELIMITER //
CREATE PROCEDURE insertar_productos(
    IN p_nombre_producto VARCHAR (100),
    IN p_descripcion_producto VARCHAR (225),
    IN p_precio_producto DECIMAL(10,2),
    IN p_existencia_poducto INT
)
BEGIN
	
	DECLARE p_producto_id CHAR(50);
    SET p_producto_id = UUID();

    INSERT INTO tb_productos(producto_id, nombre_producto, descripcion_producto, precio_producto, existencia_producto)
    VALUES (p_producto_id, p_nombre_producto, p_descripcion_producto, p_precio_producto, p_existencia_producto);
END //
DELIMITER ;

CALL insertar_productos('Camisa', 'Camisa de algodón de manga larga', 29.99, 100);
CALL insertar_productos('Pantalón', 'Pantalón vaquero para hombre', 39.99, 80);
CALL insertar_productos('Zapatos', 'Zapatos de vestir para mujer', 49.99, 120);
CALL insertar_productos('Gorra', 'Gorra ajustable con logo bordado', 9.99, 200);
CALL insertar_productos('Chaqueta', 'Chaqueta impermeable para exterior', 59.99, 50);
CALL insertar_productos('Vestido', 'Vestido elegante para ocasiones especiales', 79.99, 70);
CALL insertar_productos('Sudadera', 'Sudadera con capucha y bolsillo canguro', 34.99, 90);
CALL insertar_productos('Falda', 'Falda plisada de estilo vintage', 24.99, 110);
CALL insertar_productos('Bufanda', 'Bufanda de lana suave y cálida', 14.99, 150);
CALL insertar_productos('Botines', 'Botines de cuero con tacón bajo', 54.99, 60);
CALL insertar_productos('Pantalones cortos', 'Pantalones cortos de verano para hombre', 19.99, 180);
CALL insertar_productos('Bolsa', 'Bolsa de tela resistente con asas', 7.99, 250);
CALL insertar_productos('Camiseta', 'Camiseta básica de algodón para mujer', 12.99, 160);
CALL insertar_productos('Chaqueta deportiva', 'Chaqueta deportiva ligera con cremallera', 29.99, 100);
CALL insertar_productos('Sombrero', 'Sombrero de paja para protección solar', 17.99, 140);

SELECT * FROM tb_productos;

-- Creamos el proceso de detalles pedidos


DELIMITER //
CREATE PROCEDURE insertar_detalles_pedidos(
    IN p_pedido_id VARCHAR (50),
    IN p_producto_id VARCHAR (50),
    IN p_cantidad_detalle_pedido INT,
    IN p_precio_unitario_detalle_pedido DECIMAL(10,2),
    IN p_subtotal_detalle_pedido DECIMAL(10,2)
)
BEGIN
	
	DECLARE p_detalle_id CHAR(50);
    SET p_detalle_id = UUID();

    INSERT INTO tb_detalles_pedidos(detalle_id, pedido_id, producto_id, cantidad_detalle_pedido, precio_unitario_detalle_pedido, subtotal_detalle_pedido)
    VALUES (p_detalle_id, p_pedido_id, p_producto_id, p_cantidad_detalle_pedido, p_precio_unitario_detalle_pedido, p_subtotal_detalle_pedido);
END //
DELIMITER ;


CALL insertar_detalles_pedidos('becbbad1-d68b-11ee-b663-9c6b000a554a', 'b90eb68d-d68d-11ee-b663-9c6b000a554a', 3, 15.99, 47.97);
CALL insertar_detalles_pedidos('becc9770-d68b-11ee-b663-9c6b000a554a', 'b90f424b-d68d-11ee-b663-9c6b000a554a', 2, 10.49, 20.98);
CALL insertar_detalles_pedidos('beccee17-d68b-11ee-b663-9c6b000a554a', 'b90fdd8f-d68d-11ee-b663-9c6b000a554a', 5, 8.75, 43.75);
CALL insertar_detalles_pedidos('becd8210-d68b-11ee-b663-9c6b000a554a', 'b9104822-d68d-11ee-b663-9c6b000a554a', 1, 39.99, 39.99);
CALL insertar_detalles_pedidos('becdd792-d68b-11ee-b663-9c6b000a554a', 'b9109c19-d68d-11ee-b663-9c6b000a554a', 4, 22.50, 90.00);
CALL insertar_detalles_pedidos('bece2f11-d68b-11ee-b663-9c6b000a554a', 'b910ef7f-d68d-11ee-b663-9c6b000a554a', 2, 17.99, 35.98);
CALL insertar_detalles_pedidos('bece754f-d68b-11ee-b663-9c6b000a554a', 'b9114395-d68d-11ee-b663-9c6b000a554a', 3, 12.99, 38.97);
CALL insertar_detalles_pedidos('becec491-d68b-11ee-b663-9c6b000a554a', 'b9118c20-d68d-11ee-b663-9c6b000a554a', 2, 29.99, 59.98);
CALL insertar_detalles_pedidos('becf55d0-d68b-11ee-b663-9c6b000a554a', 'b911d13c-d68d-11ee-b663-9c6b000a554a', 1, 54.99, 54.99);
CALL insertar_detalles_pedidos('becfa644-d68b-11ee-b663-9c6b000a554a', 'b912152b-d68d-11ee-b663-9c6b000a554a', 3, 7.99, 23.97);
CALL insertar_detalles_pedidos('becffe30-d68b-11ee-b663-9c6b000a554a', 'b912c7e0-d68d-11ee-b663-9c6b000a554a', 2, 14.99, 29.98);
CALL insertar_detalles_pedidos('bed06be8-d68b-11ee-b663-9c6b000a554a', 'b9131514-d68d-11ee-b663-9c6b000a554a', 4, 19.99, 79.96);
CALL insertar_detalles_pedidos('bed0bcb6-d68b-11ee-b663-9c6b000a554a', 'b91368b3-d68d-11ee-b663-9c6b000a554a', 1, 27.50, 27.50);
CALL insertar_detalles_pedidos('bed10377-d68b-11ee-b663-9c6b000a554a', 'b913bf51-d68d-11ee-b663-9c6b000a554a', 3, 33.99, 101.97);
CALL insertar_detalles_pedidos('bed155c2-d68b-11ee-b663-9c6b000a554a', 'b91416cb-d68d-11ee-b663-9c6b000a554a', 2, 42.75, 85.50);

SELECT * FROM tb_detalles_pedidos;

