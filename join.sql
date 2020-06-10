/* SELECT titulo, 
CONCAT(nombre, " ", apellido)AS nombre_autor, 
libros.fecha_creacion FROM libros 
INNER JOIN autores ON libros.autor_id = autores.autor_id; */

/* a la izquierda y la intercepcion */
SELECT 
    CONCAT(nombre, " ", apellidos),
    libros_usuarios.libro_id
FROM usuarios
LEFT JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id;

/* usuarios
    libro usuarios
    libros
    autores
 */

 SELECT DISTINCT
    CONCAT(usuarios.nombre, " ", usuarios.apellidos) AS nombre_usuarios 
 FROM usuarios 
 INNER JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
 INNER JOIN libros ON libros_usuarios.libro_id = libros.libro_id
 INNER JOIN autores ON libros.autor_id = autores.autor_id AND autores.seudonimo IS NOT NULL;