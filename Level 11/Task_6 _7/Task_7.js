const { MongoClient } = require('mongodb');

const uri = "mongodb://localhost:27017"; 

async function run() {
    const client = new MongoClient(uri);

    try {
        await client.connect();
        const db = client.db("Ecommerce");
        const orders = db.collection("orders");

        await orders.deleteMany({}); 
        await orders.insertMany([
            { product: "Laptop", category: "Electronics", amount: 1000 },
            { product: "Shirt", category: "Fashion", amount: 30 },
            { product: "Headphones", category: "Electronics", amount: 150 },
            { product: "Shoes", category: "Fashion", amount: 80 }
        ]);

        const pipeline = [
            { $match: { amount: { $gt: 50 } } },
            {
                $group: {
                    _id: "$category",
                    totalSales: { $sum: "$amount" }
                }
            },
            { $sort: { totalSales: -1 } }
        ];

        const result = await orders.aggregate(pipeline).toArray();
        result.forEach(doc => {
            console.log({ category: doc._id, totalSales: doc.totalSales });
        });

    } catch (err) {
        console.error(err);
    } finally {
        await client.close();
    }
}
run();
