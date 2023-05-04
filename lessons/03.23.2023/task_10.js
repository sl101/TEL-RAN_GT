db.donations.aggregate([
    {
        '$lookup': {
            'from': 'users',
            'localField': 'donator_id',
            'foreignField': 'id',
            'as': 'user'
        }
    },
     { '$unwind': '$user' },
      {
        '$group': {
            '_id': '$user.country',
            'country_donats_sum': { $sum: '$amount' }
        }
    },
    {$sort: {'country_donats_sum': -1}},
    {$limit:1},
    {
        $project:{
            _id: 0,            
            country_donats_sum: 1,
            country :'$_id',
        }
    }
])