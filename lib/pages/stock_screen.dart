import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:illusionpos/providers/add_product_provider.dart';
import 'package:provider/provider.dart';

class Stok extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddProductProvider(),
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Color(0xFF212425),
          body: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              firstRow(),
              SizedBox(
                height: 20,
              ),
              secondRow(),
              SizedBox(
                height: 20,
              ),
              thirdRow(),
              SizedBox(
                height: 250,
              ),
              const SavingButton(
                buttonText: "حفظ",
                icon: Icons.save,
                color: Color(0xFFFAF950),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SavingButton extends StatelessWidget {
  final String buttonText;
  final IconData icon;
  final Color color;

  const SavingButton(
      {super.key,
      required this.buttonText,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 100,
      child: Consumer<AddProductProvider>(
        builder: (context, model, child) {
          return ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(color),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
              onPressed: () {
                // add_provider.createProduct();
                // add_provider.clearFields();
                model.createProduct();
                model.clearFields();
              },
              child: Center(
                child: Column(
                  children: [
                    // Icon(icon),
                    Text(
                      buttonText,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 44,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ));
        }
      ),
    );
  }
}

Widget firstRow() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 544,
            height: 72,
            child: Consumer<AddProductProvider>(
                builder:(context, model, child) {
                  return TextField(
                    onChanged: (value) => model.setBarcode(int.parse(value)),
                    controller: TextEditingController()..text = model.barcode.toString(),
                    decoration: const InputDecoration(
                      prefixIcon:
                      Icon(Icons.qr_code_2, color: Colors.white, size: 32),
                      fillColor: Color(0xff3C3F41),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        borderSide: BorderSide(color: Color(0xFF212425)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        borderSide: BorderSide(color: Color(0xFF212425)),
                      ),
                    ),
                    style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  );
                }
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "باركود",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
           SizedBox(
            width: 544,
            height: 72,
            child: Consumer<AddProductProvider>(
              builder: (context, model,child) {
                return TextField(
                  onChanged: model.setName,
                  controller: TextEditingController()..text = model.name.toString(),
                  textDirection: TextDirection.rtl,
                  decoration: const InputDecoration(
                    fillColor: Color(0xff3C3F41),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      borderSide: BorderSide(color: Color(0xFF212425)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      borderSide: BorderSide(color: Color(0xFF212425)),
                    ),
                  ),
                  style:
                  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                );
              }
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "الاسم",
              style: TextStyle(
                  color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget secondRow() {
  bool isChecked = false;
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "صندوق",
                  style: TextStyle(
                      color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 64,
                width: 64,
                child: Checkbox(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  value: isChecked,
                  onChanged: (value) => value,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "قطعة",
                  style: TextStyle(
                      color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 64,
                width: 64,
                child: Checkbox(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  value: isChecked,
                  onChanged: (value) => value,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "نوع الكمية",
              style: TextStyle(
                  color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
           SizedBox(
            width: 544,
            height: 72,
            child: Consumer<AddProductProvider>(
              builder: (context, model, child) {
                return TextField(
                  onChanged: (value) => model.setPrice(double.parse(value)),
                  controller: TextEditingController()
                    ..text = model.price.toString(),
                  textDirection: TextDirection.rtl,
                  decoration: const InputDecoration(
                    fillColor: Color(0xff3C3F41),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      borderSide: BorderSide(color: Color(0xFF212425)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      borderSide: BorderSide(color: Color(0xFF212425)),
                    ),
                  ),
                  style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                );
              }
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "السعر",
              style: TextStyle(
                  color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget thirdRow() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 544,
            height: 72,
            child: Consumer<AddProductProvider>(
              builder: (context, model, child) {
                return TextField(
                  onChanged: (value) => model.setPiecesInBox(int.parse(value)),
                  controller: TextEditingController()
                    ..text = model.piecesInBox.toString(),
                  textDirection: TextDirection.rtl,
                  decoration: const InputDecoration(
                    fillColor: Color(0xff3C3F41),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      borderSide: BorderSide(color: Color(0xFF212425)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      borderSide: BorderSide(color: Color(0xFF212425)),
                    ),
                  ),
                  style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                );
              }
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "قطعة في الصندوق",
              style: TextStyle(
                  color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 544,
            height: 72,
            child: Consumer<AddProductProvider>(
              builder:(context, model, child) {
                return TextField(
                  onChanged: (value) => model.setQuantity(int.parse(value)),
                  controller: TextEditingController()
                    ..text = model.quantity.toString(),
                  textDirection: TextDirection.rtl,
                  decoration: const InputDecoration(
                    fillColor: Color(0xff3C3F41),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      borderSide: BorderSide(color: Color(0xFF212425)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      borderSide: BorderSide(color: Color(0xFF212425)),
                    ),
                  ),
                  style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                );
              }
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "الكمية",
              style: TextStyle(
                  color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ],
  );
}
