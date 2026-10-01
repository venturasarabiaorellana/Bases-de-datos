drop database IF exists CONCESIONARIO;
create database CONCESIONARIO;
USE CONCESIONARIO;
create table producto (
Matricula char(7) PRIMARY KEY, -- CODIGO DEL COCHE.
Marca varchar(100),
modelo varchar(50),
descripcion text,
fabricación year, -- AÑO DE FABRICACION
fecha_matriculación date,
fecha_incorporación DATETIME,
Kilometraje int,
precio decimal (10,2),
Categoria text,
tipo_combustible set('Gasolina', 'Diésel', 'Híbrido', 'Eléctrico'),
vendido boolean,
Potencia decimal (10,2)
);

INSERT INTO producto VALUES
('1234ABC', 'Toyota', 'Corolla', 'Turismo compacto en buen estado', 2020, '2020-06-15', '2024-01-10 10:30:00', 45000, 18900.00, 'Turismo', 'Híbrido', FALSE, 122.00),

('2345BCD', 'Seat', 'León', 'Turismo deportivo y cómodo', 2021, '2021-03-20', '2024-02-15 11:00:00', 32000, 17500.00, 'Turismo', 'Gasolina', TRUE, 130.00),

('3456CDE', 'Volkswagen', 'Golf', 'Coche compacto de alta calidad', 2019, '2019-09-12', '2023-12-05 09:45:00', 58000, 16900.00, 'Turismo', 'Diésel', FALSE, 115.00),

('4567DEF', 'BMW', 'Serie 3', 'Berlina de gama alta', 2022, '2022-05-18', '2024-03-01 12:15:00', 28000, 32900.00, 'Berlina', 'Gasolina', FALSE, 184.00),

('5678EFG', 'Mercedes-Benz', 'Clase A', 'Compacto premium con buen equipamiento', 2021, '2021-11-10', '2024-03-12 10:00:00', 35000, 28900.00, 'Compacto', 'Gasolina', TRUE, 163.00),

('6789FGH', 'Audi', 'A3', 'Compacto elegante y eficiente', 2020, '2020-07-25', '2024-01-22 16:30:00', 41000, 24900.00, 'Compacto', 'Diésel', FALSE, 150.00),

('7890GHI', 'Ford', 'Focus', 'Turismo familiar práctico', 2018, '2018-04-14', '2023-11-20 13:00:00', 72000, 12900.00, 'Turismo', 'Gasolina', TRUE, 125.00),

('8901HIJ', 'Renault', 'Clio', 'Utilitario económico y fiable', 2022, '2022-08-30', '2024-02-28 09:30:00', 19000, 14500.00, 'Utilitario', 'Gasolina', FALSE, 90.00),

('9012IJK', 'Peugeot', '208', 'Utilitario moderno y económico', 2021, '2021-06-11', '2024-01-18 11:45:00', 27000, 13900.00, 'Utilitario', 'Eléctrico', FALSE, 136.00),

('1123JKL', 'Hyundai', 'Tucson', 'SUV familiar espacioso', 2020, '2020-10-05', '2024-02-10 15:20:00', 49000, 21900.00, 'SUV', 'Híbrido', TRUE, 150.00),

('2234KLM', 'Kia', 'Sportage', 'SUV cómodo para viajes largos', 2022, '2022-02-17', '2024-03-05 10:15:00', 22000, 25900.00, 'SUV', 'Diésel', FALSE, 136.00),

('3345LMN', 'Nissan', 'Qashqai', 'SUV compacto con gran equipamiento', 2019, '2019-12-02', '2023-12-18 14:00:00', 65000, 18900.00, 'SUV', 'Gasolina', FALSE, 140.00),

('4456MNO', 'Tesla', 'Model 3', 'Vehículo eléctrico de gran autonomía', 2022, '2022-09-15', '2024-03-20 09:00:00', 18000, 35900.00, 'Berlina', 'Eléctrico', TRUE, 283.00),

('5567NOP', 'Dacia', 'Duster', 'SUV económico y resistente', 2020, '2020-05-22', '2024-01-30 12:30:00', 52000, 13900.00, 'SUV', 'Gasolina', FALSE, 115.00),

('6678OPQ', 'Opel', 'Corsa', 'Utilitario pequeño y manejable', 2019, '2019-03-10', '2023-10-25 10:45:00', 68000, 10900.00, 'Utilitario', 'Gasolina', TRUE, 100.00),

('7789PQR', 'Mazda', 'CX-5', 'SUV elegante y confortable', 2021, '2021-07-19', '2024-02-05 11:30:00', 33000, 26900.00, 'SUV', 'Diésel', FALSE, 150.00),

('8890QRS', 'Honda', 'Civic', 'Turismo fiable y eficiente', 2020, '2020-11-23', '2024-01-12 16:00:00', 46000, 19900.00, 'Turismo', 'Híbrido', FALSE, 184.00),

('9901RST', 'Skoda', 'Octavia', 'Berlina espaciosa para familia', 2018, '2018-06-28', '2023-09-15 09:15:00', 85000, 11900.00, 'Berlina', 'Diésel', TRUE, 150.00),

('1023STU', 'Volvo', 'XC40', 'SUV compacto con gran seguridad', 2022, '2022-04-12', '2024-03-10 13:45:00', 16000, 31900.00, 'SUV', 'Híbrido', FALSE, 197.00),

('2134TUV', 'Fiat', '500', 'Utilitario urbano pequeño', 2019, '2019-08-16', '2023-11-10 10:30:00', 54000, 9900.00, 'Utilitario', 'Gasolina', TRUE, 69.00),

('3245UVW', 'Citroën', 'C4', 'Turismo moderno y confortable', 2021, '2021-05-09', '2024-02-22 15:00:00', 29000, 15900.00, 'Turismo', 'Diésel', FALSE, 130.00),

('4356VWX', 'Lexus', 'UX', 'SUV premium híbrido', 2020, '2020-09-21', '2024-01-25 12:00:00', 38000, 29900.00, 'SUV', 'Híbrido', FALSE, 184.00),

('5467WXY', 'Jeep', 'Renegade', 'SUV compacto para ciudad y carretera', 2019, '2019-02-13', '2023-12-12 11:15:00', 61000, 17900.00, 'SUV', 'Gasolina', TRUE, 120.00),

('6578XYZ', 'Cupra', 'Formentor', 'SUV deportivo de altas prestaciones', 2022, '2022-10-07', '2024-03-15 14:30:00', 12000, 34900.00, 'SUV', 'Gasolina', FALSE, 310.00),

('7689YZA', 'Renault', 'Megane', 'Turismo familiar cómodo y eficiente', 2020, '2020-03-18', '2024-02-01 09:45:00', 47000, 15900.00, 'Turismo', 'Híbrido', FALSE, 140.00);

select matricula, marca, modelo, kilometraje from producto 