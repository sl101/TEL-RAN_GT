-- В рамках БД 'chat' с помощью SQL напишите запрос, 
-- который вывеадет информацию о чатах  (КТО С КЕМ ОБЩАЕТСЯ), 
-- отсортированных по дате посл/сообщения
use chat;
select 
	t1.message_id,
	t1.created_at,
	t2.fullname as message_author,
	t3.fullname as message_recipient,
    t4.topic as chat_topic
from messages t1
left join users t2 on t1.author_id = t2.user_id
left join users t3 on t1.recipient_id = t3.user_id
left join chats t4 on t1.chat_id = t4.chat_id
order by t1.message_id desc;

SELECT chats.chat_id, messages.text, messages.created_at, chats.topic
FROM chats
JOIN messages on chats.chat_id=messages.chat_id
WHERE (chats.user1_id=1 OR chats.user2_id=1) AND messages.created_at = (
    SELECT MAX(created_at) FROM messages m
        WHERE chats.chat_id=m.chat_id
        )
        ORDER BY messages.created_at DESC;
        
SELECT chats.chat_id, messages.text, messages.created_at, chats.topic
FROM chats
JOIN messages on chats.chat_id=messages.chat_id
WHERE messages.created_at = (
    SELECT MAX(created_at) FROM messages m
    WHERE chats.chat_id=m.chat_id
    )
    ORDER BY messages.created_at DESC;