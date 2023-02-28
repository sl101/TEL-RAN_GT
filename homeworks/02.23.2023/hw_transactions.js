// (1) Напишите запрос, который создаст транзакцию (БД БАНК) с необходимыми полями.

db.transactions.insertOne({
	id: 'data333',
	created_at: new Date(),
	recipient_id: 'u333',
	amount: NumberInt(1000000),
	currency: 'eur',
	sender_id: 'u001',
});

// (2) Приведите в качестве примера пять типовых бизнес-процессов, связанных с транзакциями, и соотвествующие им запросы в MongoDB.

// 1. вывести транзакции по клиенту

db.transactions.find({ recipient_id: 'u333' });

// 2. почситать кол-во транзакций полученных клиентом

db.transactions.countDocuments({ recipient_id: 'u333' });

// 3. вывести транзакции суммой больше или равно 1000

db.transactions.find({ amount: { $gte: 1000 } });

// 4. вывести транзакции одного клиента суммой больше 500000

db.transactions.find({
	id: 'data333',
	amount: { $gt: 500000 },
});

// 5. добавить в информацию о транзакции поле (is_completed)

db.transactions.updateOne(
	{ id: 'data333' },
	{
		$set: { is_completed: true },
	}
);
