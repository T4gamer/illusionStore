import 'Product.dart';
import 'package:uuid/uuid.dart';

class Receipt {
  final String id;
  final DateTime date;
  final List<Product> products;
  final String paymentMethod;
  final double total;

  Receipt({
    String? id,
    DateTime? date,
    required this.products,
    required this.total,
    required this.paymentMethod
  }): id = (id == null || id.isEmpty) ? Uuid().v4() : id ,date = DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date.toIso8601String(),
    'products': products.map((product) => product.toJson()).toList(),
    'paymentMethod': paymentMethod,
    'total': total
  };

  factory Receipt.fromJson(Map<String, dynamic> json) => Receipt(
      id: json['id'],
      date: DateTime.parse(json['date']),
      products: (json['products'] as List).map((productJson) => Product.fromJson(productJson)).toList(),
      paymentMethod: json['paymentMethod'],
      total: json['total'].toDouble()
  );
}