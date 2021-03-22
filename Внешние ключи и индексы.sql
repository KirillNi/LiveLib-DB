-- Для таблиц профилей
ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE,
   ADD CONSTRAINT profiles_media_id_fk
     FOREIGN KEY (media_id) REFERENCES media(id);
     

-- Для таблицы дружбы
ALTER TABLE friendship 
  ADD CONSTRAINT friendship_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT friendship_friend_id_fk
    FOREIGN KEY (friend_id) REFERENCES users(id),
  ADD CONSTRAINT friendship_friendship_status_id_fk
    FOREIGN KEY (friendship_status_id) REFERENCES friendship_statuses(id);

   
-- Для таблицы статусов книг
ALTER TABLE books_statuses 
  ADD CONSTRAINT books_statuses_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT books_statuses_book_id_fk
    FOREIGN KEY (book_id) REFERENCES books(id),
  ADD CONSTRAINT book_statuses_book_status_id_fk
    FOREIGN KEY (book_status_id) REFERENCES statuses(id);
   
   
-- Для таблицы книг
ALTER TABLE books
  ADD CONSTRAINT books_media_id_fk
    FOREIGN KEY (media_id) REFERENCES media(id),
  ADD CONSTRAINT books_language_id_fk
    FOREIGN KEY (language_id) REFERENCES languages(id);
   
   
-- Для таблицы жанров книг
ALTER TABLE genres_books 
  ADD CONSTRAINT genres_books_books_id_fk
    FOREIGN KEY (books_id) REFERENCES books(id),
  ADD CONSTRAINT genres_books_genres_id_fk
    FOREIGN KEY (genres_id) REFERENCES genres_list(id);
   
   
-- Для таблицы постов
ALTER TABLE posts
  ADD CONSTRAINT posts_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT posts_media_id_fk
    FOREIGN KEY (media_id) REFERENCES media(id);
   
   
-- Для таблицы комментарий
ALTER TABLE comments 
  ADD CONSTRAINT comments_book_id_fk
    FOREIGN KEY (book_id) REFERENCES books(id),
  ADD CONSTRAINT comments_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id);

   
-- Для таблицы медиа
ALTER TABLE media
  ADD CONSTRAINT media_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id);
    
   
-- Индексы

CREATE INDEX books_name_idx ON books(name);

CREATE UNIQUE INDEX users_username_uq ON users(username);

CREATE INDEX users_first_name_last_name_idx ON users(first_name, last_name);
