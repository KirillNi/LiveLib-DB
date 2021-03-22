-- Выбор 10 самых читаемых книг(по статусам "Читаю сейчас" и "Прочитал") 
SELECT 
  book_id, 
  count(book_id) AS book_count
  FROM books_statuses 
    WHERE book_status_id = 2 OR book_status_id = 3 
    GROUP BY book_id
    ORDER BY count(book_id)
    DESC LIMIT 10
;


-- Выбор самого распространненого жанра
SELECT
  name,
  count(genres_id) AS genre_count
  FROM genres_books
    JOIN genres_list 
      ON genres_list.id = genres_books.genres_id 
    GROUP BY genres_id
    ORDER BY count(genres_books.genres_id)
    DESC LIMIT 1
;


-- 10 самых активных пользователей
-- (По количеству постов, прочитанных книг и оставленных комментариев)
SELECT 
  CONCAT(first_name, ' ', last_name) AS USER,
  (SELECT COUNT(*) FROM posts WHERE posts.user_id = users.id) +
  (SELECT COUNT(*) FROM books_statuses WHERE books_statuses.user_id = users.id AND books_statuses.book_status_id = 2) +
  (SELECT COUNT(*) FROM comments WHERE comments.user_id = users.id) AS overall_activity
    FROM users
    ORDER BY overall_activity
	DESC LIMIT 10
;








