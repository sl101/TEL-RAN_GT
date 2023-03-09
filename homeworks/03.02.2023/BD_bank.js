// Напишите следующие запросы к MongoDB (БД "bank"):

// (1) найти ко-во завершенных транзакций не в евро на сумму более 100
db.transactions.countDocuments({
	is_completed: true,
	currency: { $ne: 'eur' },
	amount: { $gt: 100 },
});
// (2) для всех пользователей не из Китая и не из Испании увеличить баланс на 20%
db.users.updateMany(
	{ country: { $nin: ['China', 'Spain'] } },
	{ $mul: { balance: 1.2 } }
);
// (3) разблокировать пользователей, у которых баланс больше нуля или премиальный статус
db.users.updateMany(
	{ $or: [{ balance: { $gt: 0 } }, { is_premium: true }] },
	{ $set: { is_blocked: false } }
);
// или
db.users.updateMany(
	{ $or: [{ balance: { $gt: 0 } }, { is_premium: true }] },
	{ $unset: { is_blocked: null } }
);
// (4) найти пользователей из Китая, которые заблокированы и имеют нулевой баланс
db.users.find({
	country: 'China',
	is_blocked: true,
	balance: 0,
});
// при отсутствии поля balance:
db.users.find({
	country: 'China',
	is_blocked: true,
	$or: [{ balance: 0 }, { balance: { $exists: false } }],
});
// (5) пользователям не из Китая и не из США, имеющим баланс более 5000, установить статус премиум
db.users.updateMany(
	{
		country: { $nin: ['China', 'USA'] },
		balance: { $gt: 5000 },
	},
	{
		$set: { status: 'premium' },
	}
);
// (6) Проанализируйте след/запросы

db.users.find({
	$nor: [{ country: 'China' }, { balance: { $lt: 100 } }],
});
// правильно
db.users.find({
	$nor: [
		{ country: 'China' },
		{ balance: { $lt: 100 } },
		{ balance: { $exists: false } },
	],
});

// -> поиск пользователей не из Китая с балансом не менее 100

db.users.find({
	country: { $ne: 'China' },
	balance: { $gte: 100 },
});

// -> поиск пользователей не из Китая с балансом от 100
