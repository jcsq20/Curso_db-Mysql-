/* 
¿Que tipo de entidades? Autores
Nombre: autores
*/

/* 
Columnas y tipo de dato
autor_id INT
Nombre VARCHAR(25)
Genero VARCHAR (25)
Fecha de nacimiento DATE
pais de origen VARCHAR(40) 
*/
DROP DATABASE IF EXISTS libreria_cf;
CREATE DATABASE libreria_cf;

USE libreria_cf;



CREATE TABLE autores(
    autor_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    apellido VARCHAR(25) NOT NULL,
    seudonimo VARCHAR(50) UNIQUE,
    genero ENUM("M","F"), /* M o F */
    fecha_nacimiento DATE NOT NULL,
    pais_origen VARCHAR(40) NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE libros(
    libro_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    autor_id INT UNSIGNED NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(250),
    paginas INT UNSIGNED DEFAULT 0,
    fecha_publicacion DATE NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    ventas INT UNSIGNED NOT NULL DEFAULT 0,
    stock INT UNSIGNED DEFAULT 10,
    FOREIGN KEY(autor_id) REFERENCES autores(autor_id) ON DELETE CASCADE    
);

CREATE TABLE usuarios(
    usuario_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    apellidos VARCHAR(25),
    username VARCHAR(25) NOT NULL,
    email VARCHAR(50) NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE libros_usuarios(
    libro_id INT UNSIGNED NOT NULL,
    usuario_id INT UNSIGNED NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(libro_id) REFERENCES libros(libro_id),
    FOREIGN KEY(usuario_id) REFERENCES usuarios(usuario_id)
);

INSERT INTO autores(nombre, apellido, seudonimo, genero, fecha_nacimiento, pais_origen)
VALUES   ("Stephen Edwin","King","Richard Bachman", "M","1947-09-27", "USA"),
         ("camilo","suarez","jc", "M","1999-07-14", "Colombia");

INSERT INTO libros(autor_id,titulo,fecha_publicacion)
VALUES  (1,"Carrie","1974-01-01"),
        (1, "El misterio de salmes lot", "1975-01-01"),
        (1, "El resplando", "1977-01-01"),

        (2, "Harry Potter y la piedra Filosofal", "1997-06-30"),
        (2, "Harry Potter y la camara secreta", "1998-07-02"),
        (2, "Harry Potter y el prisionero de azkaban", "1999-07-08"),
        (2, "Harry Potter y el caliz de fuego", "2000-03-20"),
        (2, "Harry Potter y la orden del Fenix", "2003-06-21"),
        (2, "Harry Potter y el misterio del principe", "2005-06-16"),
        (2, "Harry Potter y las reliquias de la muerte", "2007-07-21"),
        (2, "El resplando", "1977-01-05");

INSERT INTO usuarios(nombre, apellidos, username, email)
VALUES  ("Eduardo", "Garcia", "eduardogpg", "eduarfo@codigofaiclito.com"),
        ("Juan", "suarez", "jcsq04","juancamilosaurezquinones@gmail.com"),
        ("pedro1", "suarez", "codigo-juan", "ayuda@gmail.com"),
        ("pedro2", "suarez", "codigo-juan", "ayuda@gmail.com"),
        ("pedro3", "suarez", "codigo-juan", "ayuda@gmail.com");

INSERT INTO libros_usuarios(libro_id, usuario_id)
VALUES  (1,1),
        (2,2);

UPDATE libros SET ventas = RAND()*1000;

