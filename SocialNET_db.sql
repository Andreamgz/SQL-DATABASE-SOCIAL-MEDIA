
USE social_db;

create TABLE users (
user_id INT auto_increment,
user_handle varchar(50) NOT NULL UNIQUE,
email_address varchar(50) NOT NULL UNIQUE,
first_name varchar(100) NOT NULL,
last_name varchar(100) NOT NULL,
phonenumber char(20) UNIQUE,
follower_count INT NOT NULL DEFAULT 0,
created_at TIMESTAMP NOT NULL DEFAULT (now()),
PRIMARY KEY (user_id)
);


Insert into users(first_name, last_name, user_handle, email_address, phonenumber)
Values
('David', 'Nguyen', 'dnguyen55', 'dnguyen55@hotmail.com', '+1 685-918-5848'),
('Benjamin', 'Johnson', 'bjohnson8', 'bjohnson8@gmail.com', '+1 516-541-7045'),
('Emma', 'Scott', 'escott51', 'escott51@gmail.com', '+1 478-245-7279'),
('Grace', 'Wilson', 'gwilson11', 'gwilson11@gmail.com', '+1 682-451-9878'),
('Riley', 'Martinez', 'rmartinez14', 'rmartinez14@outlook.com', '+1 915-578-9165'),
('James', 'Thomas', 'jthomas18', 'jthomas18@gmail.com', '+1 979-612-2952'),
('Abigail', 'Walker', 'awalker37', 'awalker37@hotmail.com', '+1 243-277-4347'),
('Benjamin', 'Scott', 'bscott97', 'bscott97@hotmail.com', '+1 928-423-6883'),
('Mason', 'Rodriguez', 'mrodriguez24', 'mrodriguez24@outlook.com', '+1 253-482-2967'),
('Oliver', 'Miller', 'omiller81', 'omiller81@yahoo.com', '+1 990-401-9230'),
('Sophia', 'Clark', 'sclark18', 'sclark18@hotmail.com', '+1 929-566-9740'),
('Henry', 'Davis', 'hdavis27', 'hdavis27@gmail.com', '+1 409-884-1229'),
('Joseph', 'Jackson', 'jjackson59', 'jjackson59@outlook.com', '+1 677-418-7599'),
('Michael', 'Perez', 'mperez1', 'mperez1@outlook.com', '+1 222-320-1615'),
('Ella', 'Wilson', 'ewilson89', 'ewilson89@hotmail.com', '+1 216-950-1818'),
('Matthew', 'Torres', 'mtorres25', 'mtorres25@hotmail.com', '+1 980-366-1702'),
('Abigail', 'White', 'awhite7', 'awhite7@yahoo.com', '+1 446-579-4180'),
('David', 'Gonzalez', 'dgonzalez82', 'dgonzalez82@yahoo.com', '+1 467-749-9189'),
('Logan', 'Harris', 'lharris32', 'lharris32@gmail.com', '+1 657-734-6329'),
('William', 'Hill', 'whill18', 'whill18@yahoo.com', '+1 397-402-7339'),
('Chloe', 'Wilson', 'cwilson52', 'cwilson52@outlook.com', '+1 248-695-2494'),
('James', 'Thompson', 'jthompson98', 'jthompson98@hotmail.com', '+1 670-739-7026'),
('Riley', 'Taylor', 'rtaylor64', 'rtaylor64@gmail.com', '+1 987-202-9724'),
('Samuel', 'Gonzalez', 'sgonzalez21', 'sgonzalez21@hotmail.com', '+1 785-925-5556'),
('Zoe', 'Young', 'zyoung81', 'zyoung81@outlook.com', '+1 313-458-7007'),
('John', 'Hill', 'jhill38', 'jhill38@hotmail.com', '+1 422-339-1839'),
('Ella', 'Ramirez', 'eramirez97', 'eramirez97@hotmail.com', '+1 316-897-8552'),
('Mason', 'Harris', 'mharris75', 'mharris75@hotmail.com', '+1 832-727-7251'),
('Joseph', 'Garcia', 'jgarcia43', 'jgarcia43@gmail.com', '+1 406-480-4719'),
('Henry', 'Anderson', 'handerson40', 'handerson40@outlook.com', '+1 715-764-5580'),
('Ella', 'Moore', 'emoore49', 'emoore49@hotmail.com', '+1 937-622-3151'),
('Jacob', 'Jones', 'jjones8', 'jjones8@yahoo.com', '+1 820-606-8290'),
('Sofia', 'Torres', 'storres5', 'storres5@gmail.com', '+1 674-765-3653'),
('Benjamin', 'Hill', 'bhill34', 'bhill34@yahoo.com', '+1 530-796-1734'),
('Joseph', 'Moore', 'jmoore86', 'jmoore86@yahoo.com', '+1 998-859-1646'),
('James', 'Moore', 'jmoore90', 'jmoore90@yahoo.com', '+1 388-530-2554'),
('James', 'Johnson', 'jjohnson45', 'jjohnson45@hotmail.com', '+1 975-416-7594'),
('Lucas', 'Wilson', 'lwilson23', 'lwilson23@yahoo.com', '+1 636-776-3306'),
('Amelia', 'Wright', 'awright73', 'awright73@outlook.com', '+1 367-794-7416'),
('Grace', 'Flores', 'gflores39', 'gflores39@yahoo.com', '+1 206-460-6926');

CREATE TABLE followers (
follower_id INT NOT NULL,
following_id INT NOT NULL,
FOREIGN KEY(follower_id) REFERENCES users(user_id),
FOREIGN KEY(following_id) REFERENCES users(user_id),
PRIMARY KEY (follower_id, following_id)
);

ALTER TABLE followers
ADD CONSTRAINT check_follower_id
CHECK (follower_id <> following_id);

DELIMITER $$

CREATE TRIGGER increase_follower_count
	AFTER INSERT ON followers
    FOR EACH ROW
    BEGIN
		UPDATE users SET follower_count = follower_count +1
        WHERE user_id = NEW.following_id;
    END $$

DELIMITER ; 

INSERT INTO followers(follower_id ,following_id)
VALUES
(1,2),
(2,30),
(2,4),
(2,1),
(2,10),
(1,20),
(21,4),(11,7),(40,21),(30,13),(34,19),(12,16),(11,29),(7,23),(30,36),(34,3),(32,30),(12,2),(6,38),(34,9),(3,13),(2,16),(24,3),(13,30),(21,38),(13,25),(24,16),(8,6),(27,9),(23,17),(23,38),(33,36),(28,4),(24,27),(3,36),(31,14),(6,26),(5,36),(14,19),(13,33),(21,34),(2,34),(4,35),(27,33),(39,22);

INSERT INTO followers(follower_id, following_id)
VALUES
(15,21),(8,17),(40,15),(22,8),(1,31),(28,32),(31,18),(31,12),(26,18),(30,9),(16,15),(12,6),(30,4),(40,12),(31,16),(13,37),(24,40),(2,17),(23,40),(29,30),(13,22),(36,28),(30,34),(17,7),(22,6),(7,16),(10,37),(34,21),(8,26),(27,2),(22,12),(8,18),(33,10),(22,15),(10,23),(25,39),(7,19),(20,1),
(3,17),(16,36),(10,29),(27,35),(13,18),(33,14),(40,10),(39,1),(40,36),(1,40),(2,12),(34,40),(13,28),(40,29),(25,20),(5,22),(14,24),(16,28),(7,39),(37,12),(14,40),(1,10),(10,7),(18,27),(8,4),(14,12),(4,37),(12,28),(31,5),(25,19),(12,31),(11,1),(12,8),(5,6),(5,3),(8,22),(5,25),(36,14),
(6,31),(11,33),(2,40),(29,9),(19,1),(27,39),(3,7),(3,30),(34,28),(39,17),(30,22),(29,20),(18,25),(22,33),(8,28),(16,32),(15,29),(21,32),(7,1),(11,22),(10,26),(7,31),(35,10),(24,12),(19,26),(11,9),(25,23),(1,35),(33,38),(35,19),(12,24),(7,18),(1,28),(16,33),(18,1),(13,12);


#######


select follower_id, following_id FROM followers;
select follower_id FROM followers WHERE following_id = 1;
select COUNT(follower_id) AS followers FROM followers WHERE following_id = 2;
######


#Top 3 usuarios con mayor número de seguidores#
Select following_id, COUNT(follower_id) AS followers FROM followers group by following_id ORDER BY followers DESC LIMIT 3;

#TOP 3 usuarios pero haciendo JOIN#
Select users. user_id, users.user_handle, users.first_name, following_id, COUNT(follower_id) AS followers
FROM followers
JOIN users ON users.user_id = followers.following_id
GROUP BY following_id
ORDER BY followers DESC
LIMIT 5;


CREATE TABLE texts(
texts_id INT NOT NULL AUTO_INCREMENT,
user_id INT NOT NULL,
texts_text VARCHAR(280) NOT NULL,
num_likes INT DEFAULT 0,
num_retexts INT DEFAULT 0,
num_comments INT DEFAULT 0,
created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
FOREIGN KEY (USER_ID) REFERENCES users(user_id) ON UPDATE CASCADE, 
PRIMARY KEY (texts_id)
);

SET FOREIGN_KEY_CHECKS=0;

INSERT INTO texts(user_id, texts_text)
Values
(1, "Monday again... I need infinite coffee"),
(1, "hello world");

INSERT INTO texts(user_id, texts_text)
Values
(2, "Anyone else still looking at memes at 3 AM? 😅"),
(3, "The best ideas always come when you're about to fall asleep."),
(4, "I miss the days when my only worry was what game to play. 🎮"),
(5, "Today I realized I'm not multitasking, I just get distracted easily. 😂"),
(6, "Why do the good series always end so soon?"),
(3, "It's never too late to start over. 💪 #Motivation"),
(7, "Today, the traffic felt like a horror movie. 🚗🚗🚗"),
(8, "Does anyone else have that catchy song stuck in their head? 🎶"),
(9, "Mondays should come with a snooze button. 💤"),
(10, "Breakfast at 2 PM... anyone else? 🍳"),
(2, "I dream of eternal vacations on the beach. 🌴🌊"),
(12, "Sometimes I wonder if cats are actually training us. 🐱"),
(13, "I want a pizza the size of my problems. 🍕"),
(15, "Today, I tried to be productive... I failed, but I tried."),
(16, "Why do weekends fly by so fast? 😩"),
(18, "My motivation went for a walk and never came back."),
(20, "Chocolate is the answer to everything. 🍫"),
(21, "Life would be easier if it came with a manual."),
(22, "Memes are the daily vitamin I need. 😂"),
(23, "What do you do when procrastinating? I watch cat videos."),
(23, "I’m starting a diet... tomorrow. Today’s not the day. 😜"),
(25, "I want a puppy to keep me company during my Netflix afternoons. 🐶"),
(26, "Those extra five minutes in bed always turn into 30."),
(27, "Nothing is too urgent to skip having a coffee first."),
(28, "Today is one of those days when everything sounds better from bed. 🛌"),
(29, "I’m hungry, but I don't want to cook. Existential dilemma."),
(30, "The best sound in the world is turning off my phone on a Friday afternoon."),
(40, "I feel like if I sleep more, maybe the world will fix itself. 😴"),
(31, "Is it normal to be tired all the time, or is it just me?"),
(32, "Today is a good day to do nothing. 🙃"),
(33, "I need coffee to function, but coffee gives me anxiety. Help!"),
(34, "Remote work should include mandatory naps."),
(35, "My playlist knows more about me than I do."),
(36, "Today the Wi-Fi decided to take the day off."),
(37, "The only thing better than Friday is when Monday is a holiday."),
(38, "Today's goal: survive until lunchtime. 🥪"),
(39, "Brilliant ideas always come in the shower. 💡"),
(31, "Today I told the gym I couldn’t go... for the fifth time this week."),
(23, "Does anyone else enjoy adding things to their cart and never buying them?"),
(40, "A productive day always starts with saying, I'll do it tomorrow."),
(43, "It’s funny how five more minutes in bed feels like a perfect dream."),
(39, "My favorite way to procrastinate is reorganizing my apps."),
(36, "Today my outfit is courtesy of the 'comfy clothes' closet."),
(17, "Coffee understands me better than people. ☕"),
(5, "The best part of Sundays is having no plans."),
(55, "Being an adult is basically saying 'I'll do it tomorrow' over and over."),
(11, "If hugs were currency, I'd be broke today. 🤗"),
(21, "Today is one of those days where everything feels more complicated than it is."),
(40, "Naps should be a mandatory part of the workday."),
(3, "Sometimes I feel like my dog understands me better than I do."),
(2, "Does anyone else want to travel but doesn’t have the budget?"),
(20, "Today I woke up ready to conquer the world... but first, coffee."),
(9, "Slow Wi-Fi is public enemy number one."),
(4, "I need motivation, but I also need a nap. #Dilemmas"),
(1, "In my head, I'm productive... in reality, not so much."),
(34, "Why do the best ideas always come when I have nothing to write them down with?"),
(22, "My sneakers have more adventures than I do lately. 👟"),
(14, "Procrastination is an art I perfect every day."),
(3, "I just came here to procrastinate... anyone else?");

#¿Cuantos tweets hizo un usuario?
SELECT user_id, COUNT(*) AS texts_count
FROM texts
GROUP BY user_id
ORDER BY texts_count DESC;

#SUB CONSULTA
#OBTENER LOS TWEETS DE LOS USUARIOS QUE TIENEN MÁS DE 6 SEGUIDORES
SELECT texts_id, texts_text, user_id
FROM texts
WHERE user_id IN (
	SELECT following_id
	FROM followers
	GROUP BY following_id
	HAVING COUNT(*) > 6
    );

#SI QUISIERAMOS BORRAR ALGÚN TEXTS:
#DELETE FROM tweets WHERE tweet_id = 1;
#DELETE FROM tweets WHERE user_id = 1;
DELETE FROM texts WHERE texts_id = 176;

#REMPLAZAR

UPDATE texts SET texts_text =  REPLACE(texts_text, 'Breakfast', 'Lunch')
WHERE texts_text LIKE '%Breakfast%';


CREATE TABLE texts_likes(
	user_id INT NOT NULL,
	texts_id INT NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (texts_id) REFERENCES texts(texts_id),
	PRIMARY KEY (user_id, texts_id)
);

INSERT INTO texts_likes (user_id, texts_id)
VALUES
(8,7),(1,4),(21,19),(20,34),(11,3),(38,5),(40,1),(23,24),(31,25),(10,32),(15,11),(11,40),(25,21),(5,9),(29,1),(33,33),(24,33),(7,11),(23,35),(9,36),(20,7),(16,19),(10,33),(27,11),(6,39),(22,9),(19,25),(5,10),(12,30),(18,10),(6,38),(30,33),(18,23),(17,30),(4,19),(6,26),(4,11),(29,36),(12,34);

#OBTENER EL NUMERO DE LIKES PARA CADA TUIT
SELECT texts_id, COUNT(*) AS like_count
FROM texts_likes
GROUP BY texts_id;


#LOS PRIMEROS 5 USUARIOS EN LA PLATAFORMA
SELECT *
FROM users
ORDER BY created_at ASC
LIMIT 5;

#¿CÚANTOS USUARIOS HAY?
SELECT
	COUNT(*) AS "Total_registration"
FROM users;

#The day of the week most users register on*/

CREATE VIEW vwtotalregistrations AS
    SELECT 
        DATE_FORMAT(created_at, '%W') AS 'day of the week',
        COUNT(*) AS 'total number of registration'
    FROM
        users
    GROUP BY 1
    ORDER BY 2 DESC;
    
    SELECT 
    *
FROM
    vwtotalregistrations;
    


#The users who have never posted a text*/

SELECT *
FROM users
LEFT JOIN texts
ON users.user_id = texts.user_id
WHERE texts_id IS NULL;

#The number of text posted by most active users*/

SELECT 
	first_name,
	user_handle AS 'Username',
    COUNT(texts_text) AS 'Number of Posts'
FROM users
        JOIN texts
    ON users.user_id = texts.user_id
GROUP BY Username
ORDER BY 3 DESC
LIMIT 5;

#The total number of posts*/

SELECT
	SUM(user_posts.total_posts_per_user) AS 'Total Posts by Users'
FROM
 (SELECT 
        user_handle, COUNT(texts_text) AS total_posts_per_user
    FROM
        texts
    JOIN users ON users.user_id = texts.user_id
    GROUP BY user_handle) AS user_posts;
    
#The total number of users with posts*/
SELECT COUNT(DISTINCT users.user_id) AS total_number_of_users_with_posts
FROM
   users
        JOIN
    texts ON texts.user_id = users.user_id;
    

#The usernames with numbers as ending*/

SELECT user_id, user_handle
FROM users
WHERE
    user_handle REGEXP '[$0-9]';
    
SELECT COUNT(user_handle)
FROM users
WHERE
    user_handle REGEXP '[$1]';


SELECT user_id, user_handle
FROM users
WHERE
    user_handle REGEXP '[$A]';
    
    
SELECT COUNT(user_handle)
FROM users
WHERE user_handle REGEXP '[$A]';

#Total number of users without likes*/

SELECT 
    COUNT(*) AS total_number_of_users_without_likes
FROM
    (SELECT 
        users.user_handle, texts_likes.texts_id
    FROM
        users
    LEFT JOIN texts_likes ON users.user_id = texts_likes.user_id
    GROUP BY users.user_id , texts_likes.texts_id
    HAVING texts_id IS NULL) AS users;
    
    
    
    
    