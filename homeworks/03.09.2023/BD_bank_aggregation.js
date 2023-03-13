// В рамках БД "bank" напишите следующие запросы:

// (1) вывести размеры EURO-транзакций из ЕВРОПЫ в долларах
db.transactions.aggregate([
	{
		$lookup: {
			from: 'users',
			localField: 'sender_id',
			foreignField: 'id',
			as: 'sender',
		},
	},
	{
		$match: {
			currency: 'eur',
			'sender.is_europe': true,
		},
	},
	{ $sort: { amount: 1 } },
	{ $project: { amount: 1, _id: 0 } },
]);

// (2) вывести количество USD-транзакций из 'China'
db.transactions.aggregate([
	{
		$lookup: {
			from: 'users',
			localField: 'sender_id',
			foreignField: 'id',
			as: 'sender',
		},
	},
	{
		$match: {
			currency: 'usd',
			'sender.country': 'China',
		},
	},
	{ $count: 'users_count' },
]);

// (3) вывести три самых больших транзакции в 'usd'
db.transactions.aggregate([
	{ $match: { currency: 'usd' } },
	{ $sort: { amount: -1 } },
	{ $limit: 3 },
]);

// (4) вывести всех незаблокированных пользователей, у которых есть завершенные (is_completed) транзакции от 10 usd
db.users.aggregate([
	{
		$lookup: {
			from: 'transactions',
			localField: 'id',
			foreignField: 'sender_id',
			as: 'sended_transaction',
		},
	},
	{
		$match: {
			is_blocked: { $ne: true },
			'sended_transaction.is_completed': true,
			'sended_transaction.amount': { $gte: 10 },
			'sended_transaction.currency': 'eur',
		},
	},
]);

// (5) найти пользователей без транзакций
db.users.aggregate([
	{
		$lookup: {
			from: 'transactions',
			localField: 'id',
			foreignField: 'sender_id',
			foreignField: 'recipient_id',
			as: 'sended_transaction',
		},
	},
	{
		$lookup: {
			from: 'transactions',
			localField: 'id',
			foreignField: 'recipient_id',
			as: 'recipiented_transaction',
		},
	},
	{
		$match: {
			sended_transaction: [],
			recipiented_transaction: [],
		},
	},
]);
