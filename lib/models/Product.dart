class Product {
  final String id;
  final String name;
  final double price;
  final int barcode;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.barcode
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
    'barcode':barcode,
    'price':price,
  };
}