class Product {
  final String id;
  final String name;
  final double price;
  final int barcode;
  final int quantity;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.barcode,
      required this.quantity}
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'barcode': barcode,
        'price': price,
        'quantity' : quantity,
        // 'piecesInBox':piecesInBox,
      };
}
