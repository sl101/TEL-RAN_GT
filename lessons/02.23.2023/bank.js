// регистрация юзера
db.users.insertOne({
	id: 'u333',
	created_at: new Date(),
	fullname: 'Jon Snow',
	country: 'USA',
	email: 'snow@example.org',
});

db.users.find();
//=======================
db.users.find(
	{}, // filter
	{ country: 1, _id: 0 } // projection
);
//============================
db.users.find(
	{ country: 'Germany' } // filter
);
//=================

//Задача
// - вывести клиентов из Германии
// - только поля
// 	-- полное имя
// 	-- email
db.users.find({ country: 'Germany' }, { fullname: 1, email: 1, _id: 0 });
// ===================
db.users.countDocuments({ country: 'USA' });
// =======================
db.users.updateMany(
	{ country: 'USA' },
	{
		$set: {
			is_blocked: true,
		},
	} // action
);
// ====================
db.users.updateMany(
	{ country: 'USA' },
	{
		$unset: {
			is_blocked: null,
		},
	} // action
);
// ======================
// Задача	- установить каждому (всем) пользователю	1000 баллов	'balance'
db.users.updateMany(
	{},
	{
		$set: {
			balance: 1000,
		},
	}
);
// ===================
db.users.updateMany(
	{},
	{
		$inc: {
			balance: 250,
		},
	}
);
// ====================
db.users.find(
	{ balance: { $gte: 1000 } } // filter
);
