import 'package:illusionpos/services/DBConnection.dart';
import '../models/Product.dart';
import 'package:mongo_dart/mongo_dart.dart';


final connection = MongoDbConnection();

Future<Iterable<Product>> fetchProducts() async {
  try {
    final db = await connection.getDatabase();
    final collection = db.collection('products');
    final products = await collection.find().toList();
    await db.close();
    Iterable<Product> productsList = products.map((e) => Product(
          price: double.parse(e["price"]),
          name: e["name"],
          barcode: int.parse(e["barcode"]),
          id: e["id"],
          quantity: int.parse(e["quantity"]),
        ));
    return productsList;
  } catch (e) {
    print('Error connecting to MongoDB: $e');
    return Iterable.empty();
  }
}

Future<Product?> fetchProductById(String productId) async {
  try {
    final db = await MongoDbConnection().getDatabase();
    final collection = db.collection('products');
    final product = await collection.findOne(where.eq('id', productId));
    await db.close();
    if (product == null) {
      return null;
    }
    return Product(
      price: double.parse(product['price']),
      name: product['name'],
      barcode: int.parse(product['barcode']),
      id: product['id'],
      quantity: int.parse(product['quantity']),
    );
  } catch (e) {
    print('Error connecting to MongoDB: $e');
    return null;
  }
}

Future<void> addProduct(Product product) async {
  final db = await connection.getDatabase();
  final collection = db.collection('Product');
  await collection.insert(product.toJson());
}
