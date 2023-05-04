// Задача	- вывести долларовые ТХ от 1,000

db.transactions.find({
	amount: { $gte: 500 },
	currency: 'usd',
});

// Задача	- вывести долларовые ТХ от 500 до 1,000
db.transactions.find({
	amount: { $gte: 500, $lte: 1000 },
	currency: 'usd',
});

// Задача - вывести ко-во долларовых ТХ
db.transactions.countDocuments({
	currency: 'usd',
});

// Задача 	- удалить транзакции где сумма перевода равно 0
db.transactions.deleteMany({ amount: 0 });

// Задача 	- отметить завершенными две транзакции ID 't001', 't101'	- is_completed: true - completed_at
db.transactions.updateMany(
	{ id: { $in: ['t001', 't101'] } },
	{
		$set: {
			is_completed: true,
			completed_at: new Date(),
		},
	}
);

// ==============
db.calls.updateMany(
	{},
	{
		$pull: { topic: 'credit' },
	}
);

db.calls.updateMany(
	{}, // filter
	{
		$pullAll: {
			topic: ['credit', 'premium'],
		},
	}
);

// элемент будет добавляться каждый раз
db.calls.updateMany(
	{},
	{
		$push: { topic: 'credit' },
	}
);

// элемент будет добавляться только уникальным
db.calls.updateMany(
	{},
	{
		$addToSet: { topic: 'credit' },
	}
);

// добавляет список
db.calls.updateMany(
	{}, // filter
	{
		$addToSet: { topic: { $each: ['credit', 'premium'] } },
	}
);

// Задача 	- для всех вход. звонков от 5 мин
// (1) добавить темы общения 'debt', 'premium'
// (2) установить дату завершения звонка

db.calls.updateMany(
	{
		direction: 'in',
		duration_secs: { $qte: 60 * 5 },
	},
	{
		$addToSet: { topic: { $each: ['debt', 'premium'] } },
		$set: { completed_at: new Date() },
	}
);

// Задача 	- вывести ко-во исходящих звонков до 1 ч по теме 'credit'
db.calls.countDocuments({
	direction: 'out',
	duration_secs: { $lt: 60 * 60 },
	topic: 'credit',
});

// Задача - для всех входящих и исходящих звонков до 1 часа		(1) увеличить счетчик "listen_count" на 1		(2) убрать тему общения 'debt'
db.calls.updateMany(
	{
		direction: { $in: ['out', 'in'] },
		duration_secs: { $lte: 60 * 60 },
	},
	{
		$inc: { listen_count: 1 },
		$pull: { topic: 'debt' },
	}
);

// Задача 	- заблокировать всех пользователей из Китая
db.users.updateMany({ country: 'China' }, { $set: { is_blocked: true } });

// Задача
db.users.updateMany(
	{
		country: { $nin: ['China', 'Spain'] },
	},
	{ $unset: { is_blocked: null } }
);

// Задача	- найти всех незаблокированных пользователей из Китая и Испании
db.users.updateMany({
	country: { $in: ['China', 'Spain'] },
	is_blocked: { $ne: true },
});
// ==================================
// логические операторы
db.users.find({ $and: [{ country: 'China' }, { balance: 0 }] });
db.users.find({ $or: [{ country: 'China' }, { balance: 0 }] });

// Задача- найти всех пользователей из Германии:
// -- с балансом от 100
// ИЛИ
// -- со значением is_active: true
db.users.find({
	country: 'Germany',
	$or: [{ balance: { $gte: 100 } }, { is_active: true }],
});

// Задача
db.users.find({
	country: { $ne: 'Germany' },
	$or: [{ balance: { $gte: 5000 } }, { is_premium: true }],
});

// Задача
db.users.find({
	$nor: [
		{ country: 'Germany' },
		{ balance: { $gte: 5000 } },
		{ is_premium: true },
	],
});
// Задача
db.users.find({
	balance: { $not: { $gte: 500 } },
});

// Задача - найти всех пользователей не из Китая и с балансом не менее 100

db.users.find({
	country: { $ne: 'China' },
	balance: { $gte: 100 },
});

db.users.find({
	country: { $ne: 'China' },
	balance: { $not: { $lt: 100 } },
});

db.users.find({ $nor: [{ country: 'China' }, { balance: { $lt: 100 } }] });
