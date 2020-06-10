DELIMITER //

CREATE PROCEDURE prestamo(usuario_id INT, libro_id INT, OUT cantidad INT)
BEGIN

    SET cantidad = (SELECT stpck FROM libros WHERE libros.libro_id = libro_id);
    IF cantidad > 0 THEN

        INSERT INTO libros_usuarios(libro_id, usuario_id) VALUE(libro_id, usuario_id);
        UPDATE libros SET stock = stock -1 WHERE libros.libro_id = libro_id;

        SET cantidad = cantidad -1;
    ELSE
        SELECT "No es posible realizar el prestamo" AS Mensaje_error;
    END IF;

END//
DELIMITER ;