import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

import '../models/Product.dart';

Future<Iterable> fetchProducts() async {
  final db = await Db.create('mongodb://localhost:27017/my_database');
  await db.open();
  final collection = db.collection('products');
  final products = await collection.find().toList();
  await db.close();
  Iterable productsList = products.map((e) => Product(price:double.parse(e["price"]),name: e["name"],barcode:int.parse(e["barcode"]) ,id:e["id"]));
  return productsList;
}


Future<void> addProduct(Product product) async {
  final db = await Db.create('mongodb://localhost:27017/my_database');
  await db.open();
  final collection = db.collection('products');
  await collection.insert(product.toJson());
  await db.close();
}