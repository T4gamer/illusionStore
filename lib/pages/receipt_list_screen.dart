import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:illusionpos/models/Receipt.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/reciept_provider.dart';

class ReceiptList extends StatefulWidget {
  const ReceiptList({super.key});

  @override
  State<ReceiptList> createState() => _ReceiptListState();
}

class _ReceiptListState extends State<ReceiptList> {
  @override
  void initState() {
    super.initState();
    Provider.of<ReceiptsProvider>(context, listen: false).fetchReceipts();
  }
  late DateTime? pickedDate;
  @override
  TextEditingController _dateController = TextEditingController();
  late DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate && _selectedDate != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(_selectedDate!);
      });
    }
  }

  Widget build(BuildContext context) {
    final provider = Provider.of<ReceiptsProvider>(context);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF212425),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    child: TextField(
                      onTap: () async {
                        pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050),
                        );
                      },
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
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8, right: 124),
                    child: Text(
                      "الي",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      onTap: () async {
                        pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050),
                        );
                      },
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
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8, right: 124),
                    child: Text(
                      "من",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 544,
                    height: 72,
                    child: TextField(
                      decoration: InputDecoration(
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
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      "بحث",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                  color: Color(0xff3c3f41),
                ),
                child: Column(
                  children: [
                    const InvoiceHeader(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: provider.receipts.length,
                        itemBuilder: (context, index) {
                          final receipt = provider.receipts[index];
                          // build your list item here
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: InvoiceItem(receipt: receipt, index: index,),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Container(
                    width: 257,
                    height: 72,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Color(0xff3c3f41),
                    ),
                  ),
                  const SizedBox(
                    width: 130,
                    height: 49,
                    child: Text(
                      "الإجمالي",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InvoiceHeader extends StatelessWidget {
  const InvoiceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Color(0xff57595b),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 177,
            height: 49,
            child: Text(
              "رقم الفاتورة",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 201,
            height: 49,
            child: Text(
              "تاريخ الفاتورة",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 130,
            height: 49,
            child: Text(
              "المجموع",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 52,
            height: 49,
            child: Text(
              "ر.م",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class InvoiceItem extends StatelessWidget {
  final Receipt receipt;
  final int index;
  const InvoiceItem({super.key, required this.receipt, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Color(0xff57595b),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 177,
            height: 120,
            child: Text(
              receipt.id,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 201,
            height: 49,
            child: Text(
              "${receipt.date.year}/${receipt.date.month}/${receipt.date.day}",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 130,
            height: 49,
            child: Text(
              "${receipt.total}",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 52,
            height: 49,
            child: Text(
              "${index}",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
