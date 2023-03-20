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
	{
		$project: {
			_id: 0,
			amount_usd: { $multiply: [$amount, 1.05] },
		},
	},
]);

// (2) вывести количество USD-транзакций из 'China'
db.transactions.aggregate([
	{
		$match: {
			currency: 'usd',
		},
	},
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
			'sender.country': 'China',
		},
	},
	{ $count: 'total_chinese_txs' },
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
		$match: {
			is_blocked: { $ne: true },
		},
	},
	{
		$lookup: {
			from: 'transactions',
			localField: 'id',
			foreignField: 'sender_id',
			as: 'sended_transaction',
		},
	},
	{
		$lookup: {
			from: 'transactions',
			localField: 'id',
			foreignField: 'recipient_id',
			as: 'recipiended_transaction',
		},
	},
	{
		$match: {
			$or: [
				{
					'sended_transaction.is_completed': true,
					'sended_transaction.amount': { $gte: 10 },
					'sended_transaction.currency': 'usd',
				},
				{
					'recipiended_transaction.is_completed': true,
					'recipiended_transaction.amount': { $gte: 10 },
					'recipiended_transaction.currency': 'usd',
				},
			],
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
