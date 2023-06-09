import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/Receipt.dart';

class ProductAPI {
  late final String _baseUrl;
  late final String _searchUrl;
  late http.Client _client;

  ProductAPI._internal({required String baseUrl, required String searchUrl}) :
        _baseUrl = baseUrl,
        _searchUrl = searchUrl {
    _client = http.Client();
  }

  static ProductAPI? _instance;

  static ProductAPI get instance {
    _instance ??= ProductAPI._internal(baseUrl: "http://127.0.0.1:5000", searchUrl: "http://127.0.0.1:5000/products/search");
    return _instance!;
  }

  void configure({required String baseUrl, required String searchUrl}) {
    _baseUrl = baseUrl;
    _searchUrl = searchUrl;
    _client = http.Client();
  }

  Future<void> createProduct(Map<String, dynamic> product) async {
    final response = await _client.post(Uri.parse(_baseUrl + "/products"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(product));
    if (response.statusCode != 201) {
      throw Exception("Failed to create product");
    }
  }

  Future<Map<String, dynamic>> getProductById(String productId) async {
    final response = await _client.get(Uri.parse(_baseUrl + "/products/" + productId));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception("Product not found");
    } else {
      throw Exception("Failed to get product");
    }
  }

  Future<void> updateProduct(String productId, Map<String, dynamic> updateFields) async {
    final response = await _client.put(Uri.parse(_baseUrl + "/products/" + productId),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(updateFields));
    if (response.statusCode != 200) {
      throw Exception("Failed to update product");
    }
  }

  Future<void> deleteProduct(String productId) async {
    final response = await _client.delete(Uri.parse(_baseUrl + "/products/" + productId));
    if (response.statusCode != 200) {
      throw Exception("Failed to delete product");
    }
  }

  Future<List<Map<String, dynamic>>> searchProducts(Map<String, dynamic> searchQuery) async {
    final response = await _client.post(Uri.parse(_searchUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(searchQuery));
    if (response.statusCode == 200) {
      final List<dynamic> results = jsonDecode(response.body);
      return results.cast<Map<String, dynamic>>();
    } else {
      throw Exception("Failed to search products");
    }
  }

  void dispose() {
    _client.close();
  }
}


class InvoiceAPI {
  late final String _baseUrl;
  late http.Client _client;

  InvoiceAPI._internal({required String baseUrl}) :
        _baseUrl = baseUrl {
    _client = http.Client();
  }

  static InvoiceAPI? _instance;

  static InvoiceAPI get instance {
    _instance ??= InvoiceAPI._internal(baseUrl: "http://127.0.0.1:5000");
    return _instance!;
  }

  void configure({required String baseUrl}) {
    _baseUrl = baseUrl;
    _client = http.Client();
  }

  Future<void> createInvoice(Receipt invoice) async {
    final response = await _client.post(Uri.parse(_baseUrl + "/invoices"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(invoice.toJson()));
    if (response.statusCode != 201) {
      throw Exception("Failed to create invoice");
    }
  }

  Future<Receipt> getInvoiceById(String invoiceId) async {
    final response = await _client.get(Uri.parse(_baseUrl + "/invoices/" + invoiceId));
    if (response.statusCode == 200) {
      return Receipt.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception("Invoice not found");
    } else {
      throw Exception("Failed to get invoice");
    }
  }

  Future<List<Receipt>> getAllInvoices() async {
    final response = await _client.get(Uri.parse(_baseUrl + "/invoices"));
    if (response.statusCode == 200) {
      final List<dynamic> results = jsonDecode(response.body);
      return results.map((result) => Receipt.fromJson(result)).toList();
    } else {
      throw Exception("Failed to get all invoices");
    }
  }

  void dispose() {
    _client.close();
  }
}