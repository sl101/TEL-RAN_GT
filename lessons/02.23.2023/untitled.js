// регистрация юзера
db.users.insertOne(
    {       
        'id': 'u333',
        'created_at': new Date(),
        'fullname': 'Jon Snow',
        'country': 'USA',
        'email': 'snow@example.org'
    }
)

db.users.find()
//=======================
db.users.find(
{}, // filter   
{'country': 1, '_id': 0} // projection
)
//============================
//Задача	- вывести клиентов из Германии	- только поля		-- полное имя		-- email
db.users.find(
{'country': "Germany"} // filter   
)
//=================

db.users.find(
{'country': "Germany"},  
{'fullname': 1, email: 1,'_id': 0} 
)
