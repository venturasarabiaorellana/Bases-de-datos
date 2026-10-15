

DROP DATABASE IF EXISTS fiestas_privadas;
CREATE DATABASE fiestas_privadas CHARACTER SET utf8mb4;
USE fiestas_privadas;

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    DNI        CHAR(9)      NOT NULL UNIQUE,
    nombre     VARCHAR(50)  NOT NULL,
    apellidos  VARCHAR(80)  NOT NULL,
    tlf        VARCHAR(15)  NOT NULL,
    email      VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE local (
    id_local        INT AUTO_INCREMENT PRIMARY KEY,
    nombre          VARCHAR(100) NOT NULL,
    direccion       VARCHAR(150) NOT NULL,
    ciudad          VARCHAR(60)  NOT NULL,
    precio_alquiler DECIMAL(8,2) NOT NULL,
    capacidad       INT          NOT NULL,
    CONSTRAINT ck_local_precio    CHECK (precio_alquiler >= 0),
    CONSTRAINT ck_local_capacidad CHECK (capacidad > 0)
);

CREATE TABLE fiesta (
    id_fiesta     INT AUTO_INCREMENT PRIMARY KEY,
    nombre_evento VARCHAR(100) NOT NULL,
    tipo          ENUM('Cumpleaños','Boda','Aniversario','Graduación',
                       'Despedida','Otra') NOT NULL DEFAULT 'Otra',
    fecha         DATE         NOT NULL,
    duracion      TINYINT      NOT NULL,          -- horas
    precio_final  DECIMAL(9,2) NOT NULL,
    id_cliente    INT          NOT NULL,
    id_local      INT          NOT NULL,
    CONSTRAINT ck_fiesta_duracion CHECK (duracion BETWEEN 1 AND 12),
    CONSTRAINT ck_fiesta_precio   CHECK (precio_final >= 0),
    CONSTRAINT uq_local_fecha     UNIQUE (id_local, fecha),
    CONSTRAINT fk_fiesta_cliente  FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_fiesta_local    FOREIGN KEY (id_local)
        REFERENCES local(id_local)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE invitado (
    id_invitado INT AUTO_INCREMENT PRIMARY KEY,
    nombre      VARCHAR(50)  NOT NULL,
    apellidos   VARCHAR(80)  NOT NULL,
    email       VARCHAR(100) UNIQUE,
    tlf         VARCHAR(15)
);

CREATE TABLE asistencia (
    id_fiesta   INT NOT NULL,
    id_invitado INT NOT NULL,
    PRIMARY KEY (id_fiesta, id_invitado),
    CONSTRAINT fk_asist_fiesta   FOREIGN KEY (id_fiesta)
        REFERENCES fiesta(id_fiesta)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_asist_invitado FOREIGN KEY (id_invitado)
        REFERENCES invitado(id_invitado)
        ON UPDATE CASCADE ON DELETE CASCADE
);

USE fiestas_privadas;

-- ---------- CLIENTE ----------
INSERT INTO cliente (DNI, nombre, apellidos, tlf, email) VALUES
('12345678A', 'Laura',  'Martín Gómez',   '600111222', 'laura.martin@email.com'),
('23456789B', 'Carlos', 'Ruiz Pérez',     '611222333', 'carlos.ruiz@email.com'),
('34567890C', 'Marta',  'Sánchez López',  '622333444', 'marta.sanchez@email.com'),
('45678901D', 'Javier', 'Fernández Díaz', '633444555', 'javier.fernandez@email.com'),
('56789012E', 'Ana',    'Torres Navarro', '644555666', 'ana.torres@email.com');

-- ---------- LOCAL ----------
INSERT INTO local (nombre, direccion, ciudad, precio_alquiler, capacidad) VALUES
('Salón Los Pinos',   'Calle Real 12',              'Getafe',     1200.00, 150),
('Terraza Skyline',   'Paseo de la Castellana 200', 'Madrid',     1800.00,  80),
('Finca El Olivar',   'Camino del Olivar s/n',      'Pinto',      2500.00, 250),
('Sala Aurora',       'Calle Mayor 45',             'Leganés',     650.00,  60),
('Club Jardín Norte', 'Avenida de Europa 8',        'Alcobendas', 1500.00, 120);

-- ---------- FIESTA ----------
INSERT INTO fiesta (nombre_evento, tipo, fecha, duracion, precio_final, id_cliente, id_local) VALUES
('Cumpleaños 30 de Laura',       'Cumpleaños',  '2026-03-14', 5, 3500.00, 1, 1),
('Boda de Carlos y Elena',       'Boda',        '2026-05-23', 8, 9800.00, 2, 3),
('Graduación de Marta',          'Graduación',  '2026-06-20', 4, 2800.00, 3, 2),
('Aniversario 25 años',          'Aniversario', '2026-07-11', 6, 3100.00, 4, 4),
('Cumpleaños 40 de Laura',       'Cumpleaños',  '2026-09-12', 5, 4200.00, 1, 2),
('Despedida de soltera de Ana',  'Despedida',   '2026-10-24', 5, 2400.00, 5, 4),
('Cumpleaños infantil de Pablo', 'Cumpleaños',  '2026-11-07', 3,  900.00, 3, 1),
('Fiesta de Fin de Año',         'Otra',        '2026-12-31', 7, 4500.00, 2, 1);

-- ---------- INVITADO ----------
INSERT INTO invitado (nombre, apellidos, email, tlf) VALUES
('Lucía',   'Herrera Soto',  'lucia.herrera@email.com',  '655000001'),
('Pedro',   'Gil Marín',     'pedro.gil@email.com',      '655000002'),
('Sofía',   'Ramos Vidal',   'sofia.ramos@email.com',    '655000003'),
('David',   'Moreno Cano',   'david.moreno@email.com',   '655000004'),
('Elena',   'Castro Rey',    'elena.castro@email.com',   '655000005'),
('Raúl',    'Ortega Lara',   'raul.ortega@email.com',    '655000006'),
('Paula',   'Vega Campos',   'paula.vega@email.com',     '655000007'),
('Álvaro',  'Núñez Prado',   'alvaro.nunez@email.com',   '655000008'),
('Carmen',  'Ibáñez Roca',   'carmen.ibanez@email.com',  '655000009'),
('Sergio',  'Molina Ferrer', 'sergio.molina@email.com',  '655000010'),
('Natalia', 'Prieto Luna',   'natalia.prieto@email.com', '655000011'),
('Hugo',    'Rubio Salas',   NULL,                       '655000012');

-- ---------- ASISTENCIA ----------
INSERT INTO asistencia (id_fiesta, id_invitado) VALUES
-- Fiesta 1
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
-- Fiesta 2
(2, 1), (2, 3), (2, 6), (2, 7), (2, 8), (2, 9),
-- Fiesta 3
(3, 2), (3, 4), (3, 10), (3, 11),
-- Fiesta 4
(4, 5), (4, 6), (4, 9), (4, 12),
-- Fiesta 5
(5, 1), (5, 2), (5, 7), (5, 10), (5, 12),
-- Fiesta 6
(6, 3), (6, 8), (6, 11),
-- Fiesta 7
(7, 2), (7, 5),
-- Fiesta 8
(8, 1), (8, 4), (8, 6), (8, 9), (8, 10), (8, 12);


USE fiestas_privadas;

-- 1. Fiestas organizadas para un cliente (Laura Martín), con su local
SELECT f.nombre_evento, f.fecha, f.precio_final, l.nombre AS local
FROM fiesta f
INNER JOIN cliente c ON f.id_cliente = c.id_cliente
INNER JOIN local   l ON f.id_local   = l.id_local
WHERE c.DNI = '12345678A'
ORDER BY f.fecha;

-- 2. Invitados de una fiesta concreta (la boda, id 2)
SELECT i.nombre, i.apellidos, i.email, i.tlf
FROM asistencia a
INNER JOIN invitado i ON a.id_invitado = i.id_invitado
WHERE a.id_fiesta = 2
ORDER BY i.apellidos;

-- 3. Fiestas celebradas en un local (Salón Los Pinos)
SELECT f.nombre_evento, f.fecha, f.duracion,
       CONCAT(c.nombre, ' ', c.apellidos) AS cliente
FROM fiesta f
INNER JOIN local   l ON f.id_local   = l.id_local
INNER JOIN cliente c ON f.id_cliente = c.id_cliente
WHERE l.nombre = 'Salón Los Pinos'
ORDER BY f.fecha;

-- 4. Número de invitados por fiesta
SELECT f.nombre_evento, COUNT(a.id_invitado) AS num_invitados
FROM fiesta f
LEFT JOIN asistencia a ON f.id_fiesta = a.id_fiesta
GROUP BY f.id_fiesta, f.nombre_evento
ORDER BY num_invitados DESC;

-- 5. Facturación total por cliente
SELECT c.nombre, c.apellidos,
       COUNT(f.id_fiesta)  AS num_fiestas,
       SUM(f.precio_final) AS total_facturado
FROM cliente c
INNER JOIN fiesta f ON c.id_cliente = f.id_cliente
GROUP BY c.id_cliente, c.nombre, c.apellidos
ORDER BY total_facturado DESC;

-- 6. Porcentaje de ocupación del local en cada fiesta
SELECT f.nombre_evento, l.nombre AS local, l.capacidad,
       COUNT(a.id_invitado) AS invitados,
       ROUND(COUNT(a.id_invitado) * 100 / l.capacidad, 1) AS ocupacion_pct
FROM fiesta f
INNER JOIN local l      ON f.id_local  = l.id_local
LEFT JOIN  asistencia a ON f.id_fiesta = a.id_fiesta
GROUP BY f.id_fiesta, f.nombre_evento, l.nombre, l.capacidad;

-- 7. Invitados que han asistido a más de 2 fiestas
SELECT i.nombre, i.apellidos, COUNT(*) AS num_fiestas
FROM invitado i
INNER JOIN asistencia a ON i.id_invitado = a.id_invitado
GROUP BY i.id_invitado, i.nombre, i.apellidos
HAVING COUNT(*) > 2
ORDER BY num_fiestas DESC;

-- 8. Locales que no tienen ninguna fiesta
SELECT l.nombre, l.ciudad
FROM local l
LEFT JOIN fiesta f ON l.id_local = f.id_local
WHERE f.id_fiesta IS NULL;

-- 9. Locales libres el 31/12/2026 con capacidad de al menos 100 personas
SELECT l.nombre, l.ciudad, l.capacidad, l.precio_alquiler
FROM local l
WHERE l.capacidad >= 100
  AND l.id_local NOT IN (SELECT id_local FROM fiesta WHERE fecha = '2026-12-31');

-- 10. Próximas fiestas (a partir de hoy), ordenadas por fecha
SELECT f.nombre_evento, f.fecha, l.nombre AS local, c.apellidos AS cliente
FROM fiesta f
INNER JOIN local   l ON f.id_local   = l.id_local
INNER JOIN cliente c ON f.id_cliente = c.id_cliente
WHERE f.fecha >= CURDATE()
ORDER BY f.fecha;