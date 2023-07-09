-- SOCIAL NETWORKS
INSERT INTO projects_socialnetwork (social_network_name)
VALUES ('Facebook'), ('Instagram'), ('Pinterest'), ('Telegram'), ('TikTok'),
('Twitter'), ('VK'), ('Youtube'), ('Одноклассники');


-- FORMATS
INSERT INTO projects_formats (format)
VALUES ('Карусель'), ('Кружочек'), ('Пост'), ('Рилз'), ('Сториз');


-- CONTENT TYPE
INSERT INTO projects_contenttype (content_type)
VALUES ('Коммуникационный'), ('Образовательный'), ('Продуктовый'),
('Развлекательный'), ('Репутационный'), ('Смешанный');


-- PROGRESS
INSERT INTO projects_done (is_done)
VALUES ('Да'), ('Нет'), ('В процессе');


-- HEADINGS
INSERT INTO projects_heading (heading)
VALUES ('Кейсы'), ('Лайфстайл'), ('Услуги');


-- USERS
INSERT INTO accounts_customuser (password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined)
VALUES
('pbkdf2_sha256$600000$RCx69T03RF0sSOIKNh39Oz$hp73lzkQzYzpAH+/yEVaHbOK9fW1T5kqE2Ex6c8v6fA=',null,1,'admin','admin','admin','admin@gmail.com',1,1,'2023-07-08 14:38:10.982321'),
('pbkdf2_sha256$600000$RCx69T03RF0sSOIKNh39Oz$hp73lzkQzYzpAH+/yEVaHbOK9fW1T5kqE2Ex6c8v6fA=',null,0,'testuser1','test','user','testuser1@gmail.com',0,1,'2023-07-08 14:38:10.982321'),
('pbkdf2_sha256$600000$RCx69T03RF0sSOIKNh39Oz$hp73lzkQzYzpAH+/yEVaHbOK9fW1T5kqE2Ex6c8v6fA=',null,0,'testuser2','test','user','testuser2@gmail.com',0,1,'2023-07-08 14:38:10.982321');

INSERT INTO projects_postidea ('theme', 'short_description', 'format_id', 'publish_date', 'is_done_id', 'author_id')
VALUES
('theme 1', 'short description 1', 1, '2023-07-08', 1, 1),
('theme 2', 'short description 2', 2, '2023-07-09', 2, 1),
('theme 3', 'short description 3', 3, '2023-07-10', 2, 1),
('theme 4', 'short description 4', 4, '2023-07-11', 2, 1),
('theme 5', 'short description 5', 5, '2023-07-13', 3, 1),
('theme 6', 'short description 6', 3, '2023-07-15', 2, 1),
('theme 7', 'short description 7', 1, '2023-07-15', 2, 1),
('theme 8', 'short description 8', 2, '2023-07-17', 3, 1),
('theme 9', 'short description 9', 3, '2023-07-18', 3, 1),
('theme 10', 'short description 10', 4, '2023-07-23', 2, 1),
('theme 11', 'short description 11', 5, '2023-07-24', 3, 1),
('theme 12', 'short description 12', 2, '2023-07-26', 2, 1),
('theme 13', 'short description 13', 1, '2023-07-30', 2, 1),
('theme 1', 'short description 1', 1, '2023-07-08', 1, 2),
('theme 2', 'short description 2', 2, '2023-07-09', 2, 2),
('theme 3', 'short description 3', 3, '2023-07-10', 2, 2),
('theme 4', 'short description 4', 4, '2023-07-11', 2, 2),
('theme 5', 'short description 5', 5, '2023-07-13', 3, 2),
('theme 6', 'short description 6', 5, '2023-07-15', 2, 2),
('theme 7', 'short description 7', 1, '2023-07-15', 2, 2),
('theme 8', 'short description 8', 2, '2023-07-17', 3, 2),
('theme 9', 'short description 9', 3, '2023-07-18', 3, 2),
('theme 10', 'short description 10', 4, '2023-07-23', 2, 2),
('theme 11', 'short description 11', 5, '2023-07-24', 3, 2),
('theme 12', 'short description 12', 3, '2023-07-26', 2, 2),
('theme 13', 'short description 13', 1, '2023-07-30', 2, 2),
('theme 1', 'short description 1', 1, '2023-07-08', 1, 3),
('theme 2', 'short description 2', 2, '2023-07-09', 2, 3),
('theme 3', 'short description 3', 3, '2023-07-10', 2, 3),
('theme 4', 'short description 4', 4, '2023-07-11', 2, 3),
('theme 5', 'short description 5', 5, '2023-07-13', 3, 3),
('theme 6', 'short description 6', 1, '2023-07-15', 2, 3),
('theme 7', 'short description 7', 1, '2023-07-15', 2, 3),
('theme 8', 'short description 8', 2, '2023-07-17', 3, 3),
('theme 9', 'short description 9', 3, '2023-07-18', 3, 3),
('theme 10', 'short description 10', 4, '2023-07-23', 2, 3),
('theme 11', 'short description 11', 5, '2023-07-24', 3, 3),
('theme 12', 'short description 12', 3, '2023-07-26', 2, 3),
('theme 13', 'short description 13', 1, '2023-07-30', 2, 3);
