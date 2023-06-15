
import 'package:flutter/cupertino.dart';

import '../models/Product.dart';

class ProductProvider with ChangeNotifier {
  Stream<List<Product>> get productsStream => Stream.fromIterable([
    // [Product('Product 1', 10.0), Product('Product 2', 20.0)],
    // [Product('Product 3', 30.0), Product('Product 4', 40.0)],
  ]);

  List<Product> _products = [];

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _products.remove(product);
    notifyListeners();
  }
}