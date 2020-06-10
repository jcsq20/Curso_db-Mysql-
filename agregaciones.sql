SELECT AVG (ventas) FROM libros; /* 472.2727 */

SELECT autor_id FROM libros GROUP BY autor_id HAVING SUM(ventas)> (SELECT AVG (ventas) FROM libros); 

SELECT CONCAT(nombre," ", apellido) AS nombre_completo
FROM autores
WHERE autor_id IN(
    SELECT autor_id FROM libros GROUP BY autor_id HAVING SUM(ventas)> (SELECT AVG (ventas) FROM libros)
);