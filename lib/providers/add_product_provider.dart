import 'package:flutter/material.dart';

import '../models/Product.dart';
import '../services/product_service.dart';
import '../services/temp_objects.dart';

class AddProductProvider with ChangeNotifier {
  int _barcode = 0;
  String _name = '';
  int _quantity = 0;
  double _price = 0.0;
  int _piecesInBox = 0;

  int get barcode => _barcode;
  String get name => _name;
  int get quantity => _quantity;
  double get price => _price;
  int get piecesInBox => _piecesInBox;

  void setBarcode(int barcode) {
    _barcode = barcode;
    notifyListeners();
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setQuantity(int quantity) {
    _quantity = quantity;
    notifyListeners();
  }

  void setPrice(double price) {
    _price = price;
    notifyListeners();
  }

  void setPiecesInBox(int piecesInBox) {
    _piecesInBox = piecesInBox;
    notifyListeners();
  }

  void clearFields() {
    _barcode = 0;
    _name = '';
    _quantity = 0;
    _price = 0.0;
    _piecesInBox = 0;
    notifyListeners();
  }

  void createProduct() {
    final _product = Product(
      barcode: _barcode,
      name: _name,
      quantity: _quantity,
      price: _price,
      // piecesInBox: _piecesInBox,
      id: '',
    );
    // addProduct(_product); // add object to mongo db using product Service
    TempObjectService("../models/temp.json").saveObject(_product);
  }
}