use semimar_4;
/*1. Подсчитать общее количество лайков, которые получили пользователи младше 12 лет.*/
SELECT count(*) 
FROM likes
WHERE user_id = (SELECT user_id FROM `profiles` WHERE YEAR(CURRENT_DATE)-YEAR(`birthday`)<12);

/*Определить кто больше поставил лайков (всего): мужчины или женщины.
SELECT user_id, gender FROM `profiles` WHERE gender='m';
SELECT user_id, gender FROM `profiles` WHERE gender='f';*/

SELECT count(gender) as `количество лайков по полу`, gender as `пол`
FROM likes
JOIN profiles ON  likes.user_id = profiles.user_id 
group by gender
;

/*Вывести всех пользователей, которые не отправляли сообщения.*/
SELECT users.id, users.firstname, users.lastname
FROM likes
RIGHT JOIN users ON  likes.user_id = users.id 
WHERE likes.user_id IS NULL
;
