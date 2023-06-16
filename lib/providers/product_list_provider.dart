import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/Product.dart';

class ProductProvider with ChangeNotifier {
  StreamController<List<Product>> _streamController =
  StreamController<List<Product>>();
  Stream<List<Product>> get stream => _streamController.stream;

  List<Product> _products = [];
  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    _streamController.add(_products);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _products.remove(product);
    _streamController.add(_products);
    notifyListeners();
  }
  void removeAllProduct() {
    _products.clear();
    _streamController.add(_products);
    notifyListeners();
  }

  void dispose() {
    _streamController.close();
    super.dispose();
  }
}