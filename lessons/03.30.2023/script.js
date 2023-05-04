// users.id (1:M) donations.donator_id
// users.id (1:M) reactions.user_id
// users.id (1:M) streams.user_id
// donations.stream_id (1:M) streams.id
// reactions.stream_id (1:M) streams.id

// users.id (1:M) messages.author_id;
// chats.id (1:M) messages.chat_id;
// messages.id (1:M) reactions.message_id;
// users.id (1:M) reactions.author_id;

// users.id (1:M) chats.part1_id;
// users.id (1:M) chats.part2_id;

// users.id (1:M) transactions.sender_id;
// users.id (1:M) transactions.recipent_id;
// users.id (1:M) goods.supplier_id;

// users.id (1:M) calls.user_id;
// users.id (1:M) calls.worker_id;

// online shop
// users.id (1:M) orders.user_id
// workers.id (1:M) orders.manager_id;
// workers.id (1:M) users.manager_id;

// products.id (M:M) orders.product_id ;
// orders.id (M:M) products.order_id ;

// calls.id (1:M) users.user_id
// calls.id (1:M) workers.worker_id;

// orders.id (1:M) users.customer_id;
// orders.id (1:M) workers.manager_id;
