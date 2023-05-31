import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SellingPage.dart';

class Stok extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF212425),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            first_row(),
            SizedBox(
              height: 20,
            ),
            second_row(),
            SizedBox(
              height: 20,
            ),
            third_row(),
            SizedBox(height: 250,),
            saveingButton(buttonText: "حفظ", icon: Icons.save, color: Color(0xFFFAF950),),
          ],
        ),
      ),
    );
  }
}

class saveingButton extends StatelessWidget {
  final String buttonText;
  final IconData icon;
  final Color color;
  const saveingButton({super.key, required this.buttonText, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 100,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
          onPressed: () {},
          child: Center(
            child: Column(
              children: [
                // Icon(icon),
                Text(buttonText,style: const TextStyle(color: Colors.black, fontSize: 44, fontWeight: FontWeight.bold),),
              ],
            ),
          )
      ),
    );
  }
}


Widget first_row() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 400,
            child: TextFormField(
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Color(0xFFFAF950)),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              style: TextStyle(color: Colors.white),
              textInputAction: TextInputAction.next,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Text("باركود", style: TextStyle(color: Colors.white)),
          SizedBox(
            width: 30,
          ),
          Container(
            width: 400,
            child: TextFormField(
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Color(0xFFFAF950)),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              style: TextStyle(color: Colors.white),
              textInputAction: TextInputAction.next,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Text("الاسم", style: TextStyle(color: Colors.white)),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    ],
  );
}

Widget second_row() {
  bool isChecked = false;
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 200,
            child: Row(
              children: [
                const Text("صندوق", style: TextStyle(color: Colors.white)),
                Checkbox(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  value: isChecked,
                  onChanged: (value) => value,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text("قطعة", style: TextStyle(color: Colors.white)),
                Checkbox(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  value: isChecked,
                  onChanged: (value) => value,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          const Text("نوع الكمية", style: TextStyle(color: Colors.white)),
          const SizedBox(
            width: 30,
          ),
          Container(
            width: 400,
            child: TextFormField(
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Color(0xFFFAF950)),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              style: TextStyle(color: Colors.white),
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          const Text("السعر", style: TextStyle(color: Colors.white)),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    ],
  );
}

Widget third_row() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 180,),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 200,
                      child: TextFormField(
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Color(0xFFFAF950)),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    const Text("الكمية", style: TextStyle(color: Colors.white),),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                      width: 200,
                      child: TextFormField(
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Color(0xFFFAF950)),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text("قطة في الصندوق", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
