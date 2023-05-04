db.calls.aggregate([
	{
		// этап 1 - фильтрация
		$match: { direction: 'out' },
	},
	{
		// этап 2 - сортировка
		$sort: { duration_secs: -1 },
	},
	{
		// этап 3 - проекция
		$project: { duration_secs: 1, _id: 0 },
	},
]);
// -----------------------
db.calls.aggregate([
	{
		$sort: {
			duration_secs: -1,
		},
	},
	{ $skip: 0 },
	{
		$limit: 1,
	},
]);
// -------------------
db.goods.aggregate([
	{
		$sample: { size: 1 },
	},
]);
// -----------------
db.users.aggregate([
	{
		$match: {
			is_blocked: { $ne: true },
			balance: { $lt: 0 },
		},
	},
	{ $count: 'users_count' },
]);
// ---------------------
// Задача
// - вывести имена и балансы пользователей не из Германии
db.users.aggregate([
	{ $match: { country: { $ne: 'Germany' } } },
	{ $sort: { balance: 1 } },
	{ $project: { fullname: 1, balance: 1, _id: 0 } },
]);
// -----------------------
// Задача
// 	- вывести одного произвольного пользователя, у которого
// 			(1) баланс более 100
// 					и
// 			(2) статус не "премиум"
db.users.aggregate([
	{
		$match: {
			balance: { $gt: 100 },
			status: { $ne: 'premium' },
		},
	},
	{ $sample: { size: 1 } },
]);
// ==========================
// Задача
// - вывести все транзакции из Китая
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
			'sender.country': 'China',
		},
	},
]);

// Задача
// - вывести все транзакции из Китая и в Китай
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
		$lookup: {
			from: 'users',
			localField: 'recipient_id',
			foreignField: 'id',
			as: 'recipient',
		},
	},
	{
		$match: {
			$or: [{ 'sender.country': 'China' }, { 'recipient.country': 'China' }],
		},
	},
]);

// ------------------------
db.goods.aggregate([
	{
		$project: {
			_id: 0,
			id: 1,
			price_eur: '$price',
			price_usd: { $multiply: ['$price', 1.05] },
		},
	},
]);

// $addFields добавить поля к уже имеющимся
db.goods.aggregate([
	{ $addFields: { price_usd: { $multiply: ['$price', 1.05] } } },
]);
// =====================
// вывести все транзакции-евро из Европы в долларах
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
			'sender.is_europe': true,
			currency: 'eur',
		},
	},
	{
		$project: {
			_id: 0,
			amount: 1,
			amount_usd: { $multiply: ['$amount', 1.05] },
		},
	},
]);
