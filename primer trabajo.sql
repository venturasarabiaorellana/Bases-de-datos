drop database IF exists ESCUELA;
create database escuela;
USE ESCUELA;
create table alumnos (
dni char(9) primary key,
nombre varchar(25),
apellidos varchar(100),
domicilio varchar(200),
tlf varchar(25)
);

insert into alumnos values ('22222222A','Pepe',
'Sánchez Robles','C/Oca, 25','617778899');
INSERT INTO alumnos (dni, nombre, apellidos, domicilio, tlf) VALUES
('12345678A', 'Carlos', 'García López', 'Calle Mayor 12, Madrid', '600123456'),
('23456789B', 'Laura', 'Martínez Sánchez', 'Calle Alcalá 45, Madrid', '601234567'),
('34567890C', 'Javier', 'Rodríguez Pérez', 'Avenida de España 23, Getafe', '602345678'),
('45678901D', 'María', 'Fernández Gómez', 'Calle Toledo 18, Madrid', '603456789'),
('56789012E', 'Daniel', 'López Martín', 'Calle Real 7, Leganés', '604567890'),
('67890123F', 'Sara', 'González Ruiz', 'Calle Madrid 34, Alcorcón', '605678901'),
('78901234G', 'Pablo', 'Sánchez Díaz', 'Avenida Juan Carlos I 56, Getafe', '606789012'),
('89012345H', 'Lucía', 'Pérez Moreno', 'Calle Constitución 21, Fuenlabrada', '607890123'),
('90123456J', 'Álvaro', 'Martín Jiménez', 'Calle Mayor 89, Leganés', '608901234'),
('11223344K', 'Elena', 'Ruiz Navarro', 'Calle Goya 15, Madrid', '609012345'),
('22334455L', 'Miguel', 'Díaz Torres', 'Avenida de la Paz 42, Getafe', '610123456'),
('33445566M', 'Claudia', 'Moreno Vázquez', 'Calle Velázquez 31, Madrid', '611234567'),
('44556677N', 'Sergio', 'Muñoz Ramos', 'Calle Barcelona 9, Alcorcón', '612345678'),
('55667788P', 'Andrea', 'Álvarez Ortega', 'Calle Sevilla 27, Fuenlabrada', '613456789'),
('66778899Q', 'David', 'Romero Molina', 'Avenida Libertad 63, Leganés', '614567890'),
('77889900R', 'Paula', 'Navarro Iglesias', 'Calle Sol 11, Getafe', '615678901'),
('88990011S', 'Alejandro', 'Torres Castro', 'Calle Princesa 72, Madrid', '616789012'),
('99001122T', 'Irene', 'Domínguez Rubio', 'Calle Norte 5, Alcorcón', '617890123'),
('10111213V', 'Adrián', 'Vázquez Cabrera', 'Avenida Europa 19, Getafe', '618901234'),
('20212223W', 'Marta', 'Ramos Santos', 'Calle Luna 28, Leganés', '619012345'),
('30313233X', 'Diego', 'Molina Herrera', 'Calle Mayor 101, Madrid', '620123456'),
('40414243Y', 'Cristina', 'Iglesias León', 'Calle Olivo 14, Fuenlabrada', '621234567'),
('50515253Z', 'Ventura', 'Sarabia Orellana', 'Calle Rosa luxemburgo 9', '622345678'),
('61626364A', 'Nuria', 'Santos Vega', 'Calle Jardines 22, Alcorcón', '623456789'),
('72737475B', 'Rubén', 'Herrera Pascual', 'Calle Estación 48, Leganés', '624567890');


SELECT nombre, tlf from alumnos;
SELECT nombre, apellidos, tlf FROM alumnos;
SELECT nombre, apellidos, tlf FROM alumnos WHERE nombre= 'Ventura';