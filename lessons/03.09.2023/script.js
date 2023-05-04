// (1) увеличить поле price на 20%	$mul
// (2) уменьшить поле price на 20%	$mul

// db.goods.updateMany({}, { $mul: { price: 1.2 } });

// db.goods.updateMany({}, { $mul: { price: 0.8 } });
// =============================
// Задача
// 	- вывести всех заблокированных пользователей
db.users.find({
	is_blocked: true,
});
// 	- вывести всех не заблокированных пользователей
db.users.find({
	$or: [{ is_blocked: false }, { is_blocked: { $exists: false } }],
});
// или
db.users.find({
	$nor: [{ is_blocked: false }, { is_blocked: { $exists: true } }],
});
// или проще
db.users.find({
	is_blocked: { $ne: true },
});
// ==========================
