// (1) Вывести количественное распределение товаров по поставщикам,
// 		а также общую сумму поставленных товаров

db.goods.aggregate([
	{
		$group: {
			_id: '$supplier_id',
			total_goods_position: { $count: {} },
			total_goods_sum: {
				$sum: {
					$multiply: ['$price', '$quantity'],
				},
			},
		},
	},
	{
		$project: {
			_id: 0,
			total_goods_position: 1,
			total_goods_sum: 1,
			supplier: '$_id',
		},
	},
]);

// (2) Вывести общую и среднюю продолжительность звонков по каждой теме
db.calls.aggregate([
	{
		$unwind: {
			path: '$topic',
			preserveNullAndEmptyArrays: true,
		},
	},
	{
		$group: {
			_id: '$topic',
			total_duration: { $sum: '$duration_secs' },
			avg_duration: { $avg: '$duration_secs' },
		},
	},
]);
// (3) Вывести тему звонков, по которой общались меньше всего
db.calls.aggregate([
	{
		$unwind: {
			path: '$topic',
			preserveNullAndEmptyArrays: true,
		},
	},
	{
		$group: {
			_id: '$topic',
			total_duration: { $sum: '$duration_secs' },
		},
	},
	{
		$sort: { total_duration: 1 },
	},
	{
		$limit: 1,
	},
	{
		$project: {
			_id: 0,
			topic: '$_id',
			total_duration: 1,
		},
	},
]);
// (4) Вывести одного пользователя, с которым общались на тему кредита дольше всего
// поля: имя, продолжительность общения в часах
db.calls.aggregate([
	{
		$unwind: {
			path: '$topic',
			preserveNullAndEmptyArrays: true,
		},
	},
	{
		$match: {
			topic: 'credit',
		},
	},
	{
		$group: {
			_id: '$user_id',
			total_duration_hours: {
				$sum: { $round: [{ $divide: ['$duration_secs', 3600] }, 2] },
			},
		},
	},
	{
		$sort: { total_duration_hours: -1 },
	},
	{
		$limit: 1,
	},
	{
		$lookup: {
			from: 'users',
			localField: '_id',
			foreignField: 'id',
			as: 'user',
		},
	},
	{
		$unwind: {
			path: '$user',
			preserveNullAndEmptyArrays: true,
		},
	},
	{
		$project: {
			_id: 0,
			fullname: '$user.fullname',
			total_duration_hours: 1,
		},
	},
]);
