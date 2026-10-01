DROP database if exists ALMACEN;
create database ALMACEN;
USE ALMACEN;
create table producto (
referencia char(5) PRIMARY KEY, -- longitud fija máximo 5 char.
nombre varchar(100), -- Longitud variable máximo 100 char
categoria SET('Ropa', 'Calzado', 'Juguetes'), -- Restringe los valores
descripción text,
stock SMALLINT,
precio DECIMAL(8,2)
);

insert into producto values ('fal40','Falda de la talla 40','Ropa','Muy bonita', 25, 80.30);

insert into producto values
('cam01', 'Camiseta de algodón blanca', 'Ropa', 'Camiseta básica de algodón para uso diario', 40, 19.95),
('cam02', 'Camiseta deportiva azul', 'Ropa', 'Camiseta ligera ideal para hacer deporte', 35, 24.50),
('pan01', 'Pantalón vaquero talla 42', 'Ropa', 'Pantalón vaquero clásico de color azul', 20, 45.90),
('jer01', 'Jersey de lana gris', 'Ropa', 'Jersey de lana para los días de invierno', 15, 59.99),
('abr01', 'Abrigo largo negro', 'Ropa', 'Abrigo largo de color negro para invierno', 10, 89.95),
('ves01', 'Vestido rojo de fiesta', 'Ropa', 'Vestido elegante de color rojo', 12, 75.50),
('sud01', 'Sudadera con capucha', 'Ropa', 'Sudadera cómoda con capucha y bolsillo frontal', 30, 39.90),
('fal41', 'Falda vaquera talla 38', 'Ropa', 'Falda vaquera corta de color azul', 18, 35.75),

('dep01', 'Zapatillas deportivas blancas', 'Calzado', 'Zapatillas ligeras para correr y caminar', 25, 65.90),
('dep02', 'Zapatillas deportivas negras', 'Calzado', 'Zapatillas deportivas de color negro', 30, 72.50),
('bot01', 'Botas de invierno marrones', 'Calzado', 'Botas impermeables para los días fríos', 14, 95.00),
('bot02', 'Botines negros de mujer', 'Calzado', 'Botines elegantes de color negro', 16, 68.95),
('san01', 'Sandalias de verano', 'Calzado', 'Sandalias cómodas para el verano', 22, 29.99),
('zap01', 'Zapatos de vestir negros', 'Calzado', 'Zapatos clásicos para ocasiones formales', 12, 79.90),
('zap02', 'Zapatos casuales marrones', 'Calzado', 'Zapatos cómodos para uso diario', 20, 54.50),
('esp01', 'Espadrilles de lona', 'Calzado', 'Calzado ligero de lona para verano', 17, 32.80),

('pel01', 'Pelota de fútbol', 'Juguetes', 'Pelota de fútbol de tamaño reglamentario', 45, 18.95),
('pel02', 'Pelota de baloncesto', 'Juguetes', 'Pelota de baloncesto para interior y exterior', 30, 22.50),
('mun01', 'Muñeca de juguete', 'Juguetes', 'Muñeca con diferentes accesorios', 25, 29.99),
('coc01', 'Coche teledirigido', 'Juguetes', 'Coche teledirigido con luces y sonidos', 15, 45.90),
('puz01', 'Puzzle de 500 piezas', 'Juguetes', 'Puzzle educativo de 500 piezas', 35, 16.75),
('blo01', 'Bloques de construcción', 'Juguetes', 'Set de bloques de construcción de colores', 40, 27.50),
('pel03', 'Peluches de oso', 'Juguetes', 'Oso de peluche suave de tamaño mediano', 20, 24.95),
('jue01', 'Juego de mesa familiar', 'Juguetes', 'Juego de mesa para toda la familia', 18, 34.90),
('rom01', 'Rompecabezas de madera', 'Juguetes', 'Rompecabezas de madera para niños', 28, 19.50);

