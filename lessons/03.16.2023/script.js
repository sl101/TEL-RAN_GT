// db.transactions.aggregate([
//   {
//     $group: {
//       _id: "$currency",
//       total_count: { $count: {} },
//       total_sum: { $sum: "$amount" }
//     }
//   }
// ])
// ==============================
db.transactions.aggregate([
	{
		$group: {
			_id: '$currency',
			total_count: { $count: {} },
			total_sum: { $sum: '$amount' },
		},
	},
]);
// =================================
db.users.aggregate([
	{
		$group: {
			_id: '$id',
			total_sum: { $sum: '$amount' },
		},
	},
	{
		$project: {
			fullname: 1,
		},
	},
]);

// ==================
db.transactions.aggregate([
	{
		$match: { currency: 'usd' },
	},
	{
		$group: {
			_id: '$sender_id',
			total_send_sum: { $sum: '$amount' },
		},
	},
	{
		$sort: { total_send_sum: -1 },
	},
	{
		$limit: 1,
	},
	{
		$lookup: {
			from: 'users',
			localField: '_id',
			foreignField: 'id',
			as: 'sender',
		},
	},
	{
		$unwind: {
			path: '$sender',
			preserveNullAndEmptyArrays: true,
		},
	},
	{
		$project: {
			_id: 0,
			fullname: '$sender.fullname',
			total_send_sum: 1,
		},
	},
]);
// ======================================
db.transactions.aggregate([
	{
		$match: { currency: 'eur' },
	},
	{
		$group: {
			_id: '$sender_id',
			avg_sum: { $avg: '$amount' },
		},
	},
	{
		$sample: { size: 2 },
	},
	{
		$lookup: {
			from: 'users',
			localField: '_id',
			foreignField: 'id',
			as: 'sender',
		},
	},
]);
// ===============================
db.calls.aggregate([
	{
		$group: {
			_id: '$worker_id',
			salary: { $multiply: ['$duration_secs', 1.1] },
		},
	},
]);
