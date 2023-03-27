// В рамках БД 'platform_fe' напишите следующие запросы:
// (1) Вывести ТОП-1 стран по общей сумме пожертвований (страна + общая сумма).
db.donations.aggregate([
	{
		$lookup: {
			from: 'users',
			localField: 'donator_id',
			foreignField: 'id',
			as: 'donator',
		},
	},
	{ $unwind: '$donator' },
	{
		$group: {
			_id: '$donator.country',
			total_donation: { $sum: '$amount' },
		},
	},
	{ $sort: { total_donation: -1 } },
	{ $limit: 1 },
]);
// (2) Вывести страны со средней реакцией пользователей (напр., пользователи из США имеют сред.реакцию - 4).
db.reactions.aggregate([
	{
		$lookup: {
			from: 'users',
			localField: 'user_id',
			foreignField: 'id',
			as: 'streamer',
		},
	},
	{ $unwind: '$streamer' },
	{
		$group: {
			_id: '$streamer.country',
			raiting: { $avg: '$value' },
		},
	},
	{ $sort: { raiting: -1 } },
]);
// (3) Вывести названия стримов без пожертвований или без реакций.
db.streams.aggregate([
	{
		$lookup: {
			from: 'donations',
			localField: 'id',
			foreignField: 'stream_id',
			as: 'donations',
		},
	},
	{
		$lookup: {
			from: 'reactions',
			localField: 'id',
			foreignField: 'stream_id',
			as: 'reactions',
		},
	},
	{
		$match: {
			$or: [{ donations: { $size: 0 } }, { reactions: { $size: 0 } }],
		},
	},
	{
		$group: {
			_id: '$title',
		},
	},
	{
		$project: {
			_id: 0,
			title: '$_id',
		},
	},
]);
// (4) Вывести максимальный размер пожертвования для каждого стримера.
db.donations.aggregate([
	{
		$lookup: {
			from: 'streams',
			localField: 'stream_id',
			foreignField: 'id',
			as: 'stream',
		},
	},
	{ $unwind: '$stream' },
	{
		$group: {
			_id: '$stream.user_id',
			max_donation: { $max: '$amount' },
		},
	},
]);
// (5) Вывести ТОП-3 пожертвований из Германии (имя донатора и размер пожертвования).
db.donations.aggregate([
	{
		$lookup: {
			from: 'users',
			localField: 'donator_id',
			foreignField: 'id',
			as: 'donator',
		},
	},
	{ $unwind: '$donator' },
	{
		$match: {
			'donator.country': 'Germany',
		},
	},
	{
		$sort: {
			amount: -1,
		},
	},
	{ $limit: 3 },
	{
		$project: {
			_id: 0,
			donator: '$donator.fullname',
			amount: 1,
		},
	},
]);
