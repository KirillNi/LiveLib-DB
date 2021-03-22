DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  username VARCHAR(30) NOT NULL COMMENT "Логин",
  first_name VARCHAR(100) NOT NULL COMMENT "Имя пользователя",
  last_name VARCHAR(100) NOT NULL COMMENT "Фамилия пользователя",
  email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта",
  phone VARCHAR(100) NOT NULL UNIQUE COMMENT "Телефон",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Дата регистрации",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Дата обновления строки"
) COMMENT "Пользователи";  


DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
  user_id INT(10) UNSIGNED NOT NULL PRIMARY KEY COMMENT "Ссылка на пользователя", 
  media_id INT(10) UNSIGNED NOT NULL COMMENT "Ссылка на идентификатор медиа",
  gender ENUM('мужской', 'женский') NOT NULL COMMENT "Пол",
  birthday DATE COMMENT "Дата рождения",
  city VARCHAR(130) COMMENT "Местоположение",
  status ENUM('Читатель', 'Автор') NOT NULL COMMENT "Статус профиля",
  about_yourself VARCHAR(255) COMMENT "О себе",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
  KEY (media_id)
) COMMENT "Профили"; 


DROP TABLE IF EXISTS books;
CREATE TABLE books (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор книги",
  name VARCHAR(255) NOT NULL COMMENT "Название",
  media_id INT UNSIGNED NOT NULL COMMENT "Ссылка на идентификатор медиа",
  author VARCHAR(255) NOT NULL COMMENT "Автор",
  description TEXT COMMENT "Описание",
  publisher VARCHAR(255) COMMENT "Издательство",
  isbn VARCHAR(50) COMMENT "ISBN",
  publish_year INT(4) COMMENT "Год издания",
  language_id INT UNSIGNED NOT NULL COMMENT "Ссылка на идентификатор языка",
  age ENUM('0+','3+','12+','16+','18+') COMMENT "Возрастное ограничение",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
  KEY (media_id)
) COMMENT "Книги";


DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор комментрия",
  book_id INT UNSIGNED NOT NULL COMMENT "Идентификатор книги",
  user_id INT UNSIGNED NOT NULL COMMENT "Автор комментария",
  body LONGTEXT COMMENT "Текст комментария",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания комментария",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
  KEY (book_id)
) COMMENT "Комментарии";


DROP TABLE IF EXISTS friendship;
CREATE TABLE friendship (
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на инициатора дружеских отношений",
  friend_id INT UNSIGNED NOT NULL COMMENT "Ссылка на получателя приглашения дружить",
  friendship_status_id INT UNSIGNED NOT NULL COMMENT "Ссылка на статус (текущее состояние) отношений",
  requested_at DATETIME DEFAULT NOW() COMMENT "Время отправления приглашения дружить",
  confirmed_at DATETIME COMMENT "Время подтверждения приглашения",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",  
  PRIMARY KEY (user_id, friend_id) COMMENT "Составной первичный ключ"
) COMMENT "Дружба";


DROP TABLE IF EXISTS friendship_statuses;
CREATE TABLE friendship_statuses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название статуса",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Статусы дружбы";


DROP TABLE IF EXISTS genres_list;
CREATE TABLE genres_list (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор жанра",
  name VARCHAR(100) NOT NULL UNIQUE COMMENT "Название жанра",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Список жанров";


DROP TABLE IF EXISTS genres_books;
CREATE TABLE genres_books (
  books_id INT UNSIGNED NOT NULL COMMENT "Ссылка на идентификатор книги",
  genres_id INT UNSIGNED NOT NULL COMMENT "Ссылка на идентификатор жанра",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Жанры книг";


DROP TABLE IF EXISTS languages;
CREATE TABLE languages (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор языка",
  name VARCHAR(100) NOT NULL UNIQUE COMMENT "Название",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Языки";


DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор статьи",
  name VARCHAR(150) NOT NULL COMMENT "Название статьи",
  body LONGTEXT COMMENT "Текст статьи",
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на автора статьи",
  media_id INT UNSIGNED NOT NULL COMMENT "Ссылка на идентификатор медиа",
  source VARCHAR(255) COMMENT "Источник",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
  KEY (media_id)
) COMMENT "Статьи";


DROP TABLE IF EXISTS media;
CREATE TABLE media (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор медиа",
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя, который загрузил файл",
  filename VARCHAR(255) NOT NULL COMMENT "Путь к файлу",
  size INT NOT NULL COMMENT "Размер файла",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
  KEY (user_id)
) COMMENT "Медиафайлы";


DROP TABLE IF EXISTS books_statuses;
CREATE TABLE books_statuses (
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
  book_id INT UNSIGNED NOT NULL COMMENT "Ссылка на книгу",
  book_status_id INT UNSIGNED NOT NULL COMMENT "Ссылка на статус",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Статусы книг";


DROP TABLE IF EXISTS statuses;
CREATE TABLE statuses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор статуса",
  name VARCHAR(50) NOT NULL COMMENT "Название статуса",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Статусы";









