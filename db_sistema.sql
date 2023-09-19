create database db_sistema;
use db_sistema ;
create table facturas(
id_facturas int primary key not null,
fecha_factura date,
total int not null
);
create table clientes(
id_cliente int primary key not null,
primer_nombre varchar(100) not null,
segundo_nombre varchar(100),
primer_apellido varchar(100) not null,
segundo_apellido varchar(100) not null,
direccion varchar(100) not null,
celular varchar(10) not null,
email varchar(100) not null unique
);
create table pedidos( 
id_pedido int primary key not null,
fecha_pedido date not null,
cantidad int not null,
total int not null, 
precio_unitario int not null,
id_cliente int not null,
foreign key (id_cliente) references clientes(id_cliente)
);
create table productos(
id_producto int primary key not null,
nombre varchar(100) not null,
precio int not null,
cant_inventario int not null,
id_facturas int not null,
id_pedido int not null,
foreign key (id_facturas) references facturas(id_facturas),
foreign key (id_pedido) references pedidos(id_pedido)
);
create table clientes_productos(
id_clientes_producto int primary key not null,
id_cliente int not null,
id_producto int not null,
foreign key (id_cliente) references clientes(id_cliente),
foreign key (id_producto) references productos(id_producto)
);

create table producto_pedidos (
id_productos_pedidos int primary key not null,
id_producto int not null,
id_pedido int not null,
foreign key (id_producto) references productos (id_producto),
foreign key (id_pedido) references pedidos (id_pedido)
);

insert into facturas (id_facturas, fecha_factura, total) values (1011, '2023-08-13', 230.000);
insert into facturas (id_facturas, fecha_factura, total) values 
(1112, '2023-03-14', 20.000),
(1213, '2022-01-1', 120.000),
(1415, '2022-12-11', 160.000),
(1516, '2022-12-12', 300.000);
 
 select * from facturas;
 
 insert into clientes (id_cliente, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, direccion, celular, email) values 
 (1, 'Sofia', null,'Ortiz', 'Barreto', 'Carrera 33', 3002842947, 'Sofiortizb1@gmail.com'),
 (2, 'Dayana','Andrea','Rojas','Becerra', 'calle 80-30', 3156789090, 'daya@gmail.com'), 
 (3, 'Tatiana',null,'Gutierrez','Campos', 'carrera 45-50', 3116789090, 'tatiana@gmail.com'), 
 (4, 'Tomas',null,'Estrada','Campos', 'carrera 26-78', 3146689090, 'tomas@gmail.com'), 
 (5, 'Maria',null,'Barreto','Lievano', 'carrera 33-19', 3166789050, 'Maria@gmail.com');
 
 select*from clientes;
 
 insert into pedidos (id_pedido, fecha_pedido, cantidad, total, precio_unitario, id_cliente) values 
 (01, '2023-08-10', 2, 5.000, 2.500,1),
 (02, '2023-02-10', 3, 15.000, 5.000,2),
 (03, '2023-03-12', 6, 36.000, 6.000,3),
 (04, '2022-02-12', 1, 20.000, 20.000,4),
 (05, '2023-01-1', 10, 200.000, 20.000,5);
 
 select*from pedidos;
 
 insert into productos (id_producto, nombre, precio, cant_inventario, id_facturas, id_pedido) values
 (11, 'productoA', 2.500, 400, 1011, 01),
 (12, 'productoB', 5.000, 40, 1112, 02),
 (13, 'productoC', 6.000, 100, 1213, 03),
 (14, 'productoD', 20.000, 10, 1415, 04),
 (15, 'productoE', 20.000, 45, 1516, 05);
 
 select*from productos;
 
 insert into clientes_productos (id_clientes_producto, id_cliente, id_producto) values 
 (34,1,11),
 (35,2,12),
 (36,3,13),
 (37,4,14),
 (38,5,15);
 
 select*from clientes_productos;
 
insert into producto_pedidos (id_productos_pedidos, id_producto, id_pedido) values 
(444,11,01),
(445,12,02),
(446,13,03),
(447,14,04),
(448,15,05);

select*from producto_pedidos;