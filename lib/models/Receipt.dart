import 'Product.dart';

class Receipt {
  final String id;
  final DateTime date;
  final List<Product> products;
  final String paymentMethod;
  final double total;

  Receipt({
    required this.id,
    required this.date,
    required this.products,
    required this.total,
    required this.paymentMethod
  });
}