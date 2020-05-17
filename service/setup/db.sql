
CREATE DATABASE IF NOT EXISTS `dogdb`;

CREATE USER IF NOT EXISTS 'dogooo'@'%' IDENTIFIED BY 'dogZgoneWild' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0 ;

GRANT USAGE ON *.* TO 'dogooo'@'%';

GRANT SELECT ON `dogdb` . * TO 'dogooo'@'%';
GRANT INSERT ON `dogdb` . * TO 'dogooo'@'%';

USE `dogdb`;

CREATE TABLE IF NOT EXISTS user ( id INT NOT NULL AUTO_INCREMENT, username VARCHAR(22) CHARACTER SET utf8 not null, password VARCHAR(22) not null, PRIMARY KEY (id) );

CREATE TABLE IF NOT EXISTS post ( id INT NOT NULL AUTO_INCREMENT, post_text TEXT CHARACTER SET utf8, fk_user_id int not null, rating int not null default 0, dog_pic varchar(255), PRIMARY KEY (id) );

CREATE TABLE IF NOT EXISTS comment ( id INT NOT NULL AUTO_INCREMENT, comment_text TEXT CHARACTER SET utf8, fk_post_id int not null, cname varchar(20) not null, PRIMARY KEY(id) );

INSERT INTO `user` (username, password) VALUES ("adougé","MCHcanttouchthis1"),("demidog","princesses_password");

INSERT INTO `post` (post_text, fk_user_id, rating, dog_pic) VALUES ("This is Trigger. He does not know what happened to the trash can. Offended that you would even ask him. 12/10 no further questions",2, 12, "images/img_1.jpg");

INSERT INTO `comment` (comment_text, fk_post_id,cname) VALUES ("Great find, this one is so cute!",2, "anon"), ("Thanks for posting",1, "anon");

INSERT INTO `post` (post_text, fk_user_id, rating, dog_pic) VALUES ("Say hello to Jackson and Kensi. They're learning how to parallel bark. Thought two heads would be better than one. Both 12/10 would endorse",2, 12, "images/img_2.jpg");
INSERT INTO `post` (post_text, fk_user_id, rating, dog_pic) VALUES ("This is Griffey. His St. Patrick's Day bow tie didn't arrive until this morning. Politely requests that everyone celebrate again. 13/10",2, 13, "images/img_3.jpg");
INSERT INTO `post` (post_text, fk_user_id, rating, dog_pic) VALUES ("This is outrageous. We do not rate Deadly Moroccan Road Lions, no matter how jubilant they may appear. We only rate dogs... 12/10",2, 12, "images/img_4.jpg");
INSERT INTO `post` (post_text, fk_user_id, rating, dog_pic) VALUES ("This is Remi. She just discovered that tiny legs don't generate the forces required for this activity. 13/10 would volunteer to push",2, 13, "images/img_5.jpg");
INSERT INTO `post` (post_text, fk_user_id, rating, dog_pic) VALUES ("This is Poppy. She's doing her best.13/10 hopes you're proud of her",2, 13, "images/img_6.jpg");
INSERT INTO `post` (post_text, fk_user_id, rating, dog_pic) VALUES ("This is Bailey. She likes to honk the horn at stoplights. It makes her feel powerful. 12/10 would buckle pup",2, 12, "images/img_7.jpg");
INSERT INTO `post` (post_text, fk_user_id, rating, dog_pic) VALUES ("Alright haha very funny. Sending in a picture without a dog in it. You got me. But really please only send dogs we work hard over here and deserve to be taken seriously... 13/10",2, 13, "images/img_8.jpg");
INSERT INTO `post` (post_text, fk_user_id, rating, dog_pic) VALUES ("This is Mochi. It's his first robbery. Forgot a weapon but would still like you to please put your hands pup and show him where you keep the snacks... or else. 12/10",2, 12, "images/img_9.jpg");
INSERT INTO `post` (post_text, fk_user_id, rating, dog_pic) VALUES ("anyways look at cute photos of my dog from this weekend, he was born with a disorder called iris hypoplasia so he has to wear doggles when it's sunny out",2, 12, "images/img_10.jpg");
INSERT INTO `post` (post_text, fk_user_id, rating, dog_pic) VALUES ("This is Nacho. The kitchen exploded. That is all we know at this time. Offered to help get to the bottom of it. 14/10 thank you Nacho",2, 14, "images/img_11.jpg");
INSERT INTO `post` (post_text, fk_user_id, rating, dog_pic) VALUES ("Very funny April Fools' joke guys, but seriously please stop sending in pics without dogs in them. We only rate dogs. Thank you... 13/10",2, 13, "images/img_12.jpg");
INSERT INTO `post` (post_text, fk_user_id, rating, dog_pic) VALUES ("This is Gwendy. She has lupus, so she needs to wear doggles and sunscreen whenever she plays outside. Doesn''t seem to mind it. Actually quite stylish. 14/10",2, 14, "images/img_13.jpg");
INSERT INTO `post` (post_text, fk_user_id, rating, dog_pic) VALUES ("This is Milo. He can't believe he was hit by a snowball in April. Way too late for such frigid nonsense. 13/10 would chilly boop",2, 13, "images/img_14.jpg");
INSERT INTO `post` (post_text, fk_user_id, rating, dog_pic) VALUES ("This is Beaux. He would like to box, but only if you go easy on him. Might hit you with a left hook or maybe a swift puppercut. 12/10",2, 12, "images/img_15.jpg");
INSERT INTO `post` (post_text, fk_user_id, rating, dog_pic) VALUES ("This is Esa. She's learned that as nap frequency increases, so does the effort required to keep her tongue in her mouth. 13/10 #SeniorPupSaturday",2, 13, "images/img_16.jpg");

INSERT INTO `post` (post_text, fk_user_id, rating, dog_pic) VALUES ("This is Toby. He shows his tongue and his new dog tag to everyone he drives by. Wants them to know he's a certified 12/10",2, 12, "images/img_17.jpg");
INSERT INTO `post` (post_text, fk_user_id, rating, dog_pic) VALUES ("This is Boris and Doug. They've been best friends since the day they met. Boris likes to count Doug's spots but always loses track. That's ok Boris. Both 14/10",2, 14, "images/img_18.jpg");
INSERT INTO `post` (post_text, fk_user_id, rating, dog_pic) VALUES ("This is Frida. She became Mexico's symbol for hope after the 2017 earthquakes. It's reported she's located over 50 people in her long rescue career. Today, her protective gear was removed and replaced with a toy to signify her retirement and a new beginning. 15/10",2, 15, "images/img_19.jpg");
#INSERT INTO `post` (post_text, fk_user_id, rating, dog_pic) VALUES ("",2, 15, "images/img_13.jpg");
INSERT INTO `post` (post_text, fk_user_id, rating, dog_pic) VALUES ("This is Duffy. If you look closely, you can see exactly where the mud attacked him. Fortunately for the mud, there were no witnesses. 12/10 let's get you cleaned pup",2, 12, "images/img_20.jpg");
