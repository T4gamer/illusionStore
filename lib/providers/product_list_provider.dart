import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:illusionpos/models/Receipt.dart';
import 'package:illusionpos/services/APIConnection.dart';
import '../models/Product.dart';

class ProductProvider with ChangeNotifier {
  StreamController<List<Product>> _streamController =
  StreamController<List<Product>>();
  Stream<List<Product>> get stream => _streamController.stream;
  double _totalPrice = 0;
  double get totalPrice => _totalPrice;
  String _paymentMethod = "";
  String get paymentMethod => _paymentMethod;
  List<Product> _products = [];
  List<Product> get products => _products;

  TextEditingController _controller = TextEditingController();
  String _text = '';

  TextEditingController get controller => _controller;
  String get text => _text;


  List<Map<String, dynamic>> _searchResults = [];

  List<Map<String, dynamic>> get searchResults => _searchResults;

  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  MyListProvider() {
    // Scroll to the last item when the view is built
    WidgetsBinding.instance.addPostFrameCallback((_) => animateToLast());
  }

  void animateToLast() {
    if(_products.length > 8){
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 500),
      );
    }
  }

  Future<void> onSubmitted(String value) async {
    final Product scaned = await Searchbarcode(value);
    if(scaned != null){
      addProduct(scaned);
      notifyListeners();
    }
    notifyListeners();
  }

  Future<Product> Searchbarcode(String value) async {
    _text = value;
    final searchQuery = {"barcode": int.parse(value)};
    _searchResults = await ProductAPI.instance.searchProducts(searchQuery);
    final Product result = Product.fromJson(searchResults.first);
    notifyListeners();
    return result;
  }

  void calculateTotal() {
    _totalPrice = 0;
    for (Product product in _products) {
      _totalPrice += product.price * product.quantity;
    }
  }

  void removeProduct(Product product) {
    _totalPrice -= product.price;
    _products.remove(product);
    _streamController.add(_products);
    notifyListeners();
  }

  void removeAllProduct() {
    _totalPrice = 0;
    _products.clear();
    _streamController.add(_products);
    notifyListeners();
  }

  void dispose() {
    _streamController.close();
    super.dispose();
  }
  //primitive calculation
  void removeProductAt(index) {
    _totalPrice -= products[index].price;
    _products.removeAt(index);
    _streamController.add(_products);
    notifyListeners();
  }

  void addProduct(Product product) {
    //primitive way to do it
    _totalPrice += product.price;
    _products.add(product);
    _streamController.add(_products);
    animateToLast();
    notifyListeners();
  }
  Future<void> saveReceipt() async {
    Receipt receipt = Receipt(products: products, total: _totalPrice, paymentMethod: "");
    await InvoiceAPI.instance.createInvoice(receipt);
  }
}