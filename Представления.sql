CREATE OR REPLACE VIEW users_comments AS
  SELECT
    concat(u.first_name, ' ', u.last_name) AS user,
    c.book_id,
    c.body AS body
  FROM
    users AS u
  JOIN comments AS c
    ON u.id = c.user_id
    ORDER BY user ASC;
 
SELECT * FROM users_comments;


CREATE OR REPLACE VIEW users_profiles AS
  SELECT 
    p.city,
    concat(u.first_name, ' ', u.last_name) AS user
  FROM 
    users AS u
  JOIN profiles AS p
    ON u.id = p.user_id 
    ORDER BY city;
      
SELECT * FROM users_profiles;
