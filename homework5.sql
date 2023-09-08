/*1. Создайте представление, в которое попадет информация о пользователях (имя, фамилия,
город и пол), которые не старше 20 лет.*/

CREATE OR REPLACE VIEW users_profiles AS
(SELECT users.firstname, users.lastname, profiles.hometown, profiles.gender
from users, profiles
where profiles.user_id = users.id and YEAR(CURRENT_DATE)-YEAR(`birthday`)<21);

select *
from users_profiles;

/*2. Найдите кол-во, отправленных сообщений каждым пользователем и выведите
ранжированный список пользователей, указав имя и фамилию пользователя, количество сообщений и место в рейтинге (первое место у пользователя с максимальным
количеством сообщений) . (используйте DENSE_RANK)*/

select users.firstname, users.lastname,
sum(messages.from_user_id) over(ORDER BY users.lastname) as massg,
DENSE_RANK() over(ORDER BY users.lastname DESC) as `Рейтинг`
from users, messages;

/*3. Выберите все сообщения, отсортируйте сообщения по возрастанию даты отправления
(created_at) и найдите разницу дат отправления между соседними сообщениями, получившегося
списка. (используйте LEAD или LAG)
*/

select messages.from_user_id, created_at,
lag(created_at, 1, NULL ) over(ORDER BY created_at) as massg
from messages;
