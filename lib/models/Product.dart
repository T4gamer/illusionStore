import 'dart:math';

import 'package:uuid/uuid.dart';

class Product {
  final String id;
  final String name;
  double price;
  final int barcode;
  int quantity;

  Product(
      {
        String? id,
        required this.name,
        required this.price,
        int? barcode,
        required this.quantity}
      ) : id = (id == null || id.isEmpty) ? Uuid().v4() : id,
        barcode = (barcode == null || barcode == 0) ? Random().nextInt(1000000000) : barcode;


  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      barcode: json['barcode'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'barcode': barcode,
        'price': price,
        'quantity' : quantity,
        // 'piecesInBox':piecesInBox,
      };
}
