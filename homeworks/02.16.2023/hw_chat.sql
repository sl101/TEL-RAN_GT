-- В рамках БД 'chat' с помощью SQL напишите запрос, 
-- который вывеадет информацию о чатах  (КТО С КЕМ ОБЩАЕТСЯ), 
-- отсортированных по дате посл/сообщения

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