import 'package:flutter/material.dart';
import 'package:illusionpos/pages/receipt_list_screen.dart';
import 'package:illusionpos/pages/selling_screen.dart';
import 'package:illusionpos/pages/stock_screen.dart';
import 'package:illusionpos/providers/product_list_provider.dart';
import 'package:illusionpos/providers/reciept_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ProductProvider()),
    ChangeNotifierProvider(create: (context) => ReceiptsProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IllusionPos',
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
