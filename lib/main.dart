import 'package:flutter/material.dart';
import 'package:illusionpos/pages/receipt_list_screen.dart';
import 'package:illusionpos/pages/selling_screen.dart';
import 'package:illusionpos/pages/stock_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/': (context) => SalesPage(),
        '/receipt_list': (context) => ReceiptList(),
        '/stok': (context) => Stok(),
        '/sales_page': (context) => SalesPage(),
      },
    );
  }
}
