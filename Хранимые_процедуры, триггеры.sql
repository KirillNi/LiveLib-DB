-- Процедура для поиска книги по языку
DELIMITER //

CREATE PROCEDURE new_books (language_arg VARCHAR(100))
BEGIN
  SELECT 
  books.name,
  languages.name AS language
  FROM books
    JOIN languages
      ON books.language_id = languages.id
    WHERE languages.name = language_arg;
END //

DELIMITER ;

CALL new_books('русский'); 


-- Триггер для проверки текста поста
DELIMITER //

CREATE TRIGGER validate_post_body BEFORE INSERT ON posts
FOR EACH ROW BEGIN
	IF NEW.body IS NULL THEN 
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Body is NULL';
  END IF;
END //

DELIMITER ;

INSERT INTO posts 
  (name, body, user_id, media_id, source)
VALUES 
  ('wkfm', NULL, 10, 88, 'wkfmwfk');
  