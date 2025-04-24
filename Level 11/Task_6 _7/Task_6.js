const { MongoClient } = require('mongodb');

const uri = 'mongodb://localhost:27017'; 
const client = new MongoClient(uri);

async function run() {
  try {
    await client.connect();
    const db = client.db('product_catalog'); 
    const products = db.collection('products');

    await products.insertMany([
      { name: "Wireless Mouse", description: "Ergonomic wireless mouse", price: 25 },
      { name: "Mechanical Keyboard", description: "RGB backlit keyboard", price: 80 },
      { name: "Gaming Mousepad", description: "Large mousepad for gamers", price: 20 }
    ]);
    console.log("Inserted 3 products.");

    await products.createIndex({ name: "text", description: "text" });
    console.log("Created text index on 'name' and 'description'.");

    const mouseResults = await products.find({ $text: { $search: "mouse" } }).toArray();
    console.log(" Search Results for 'mouse':", mouseResults);

    await products.updateOne(
      { name: "Gaming Mousepad" },
      { $set: { price: 15 } }
    );
    console.log(" Updated price of Gaming Mousepad to 15.");

    await products.deleteOne({ price: 80 });
    console.log(" Deleted product with price 80.");

  } catch (err) {
    console.error("Error:", err);
  } finally {
    await client.close();
  }
}

run();
