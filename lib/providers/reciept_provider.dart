import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Receipt.dart';
import '../services/APIConnection.dart';

class ReceiptsProvider with ChangeNotifier {
  List<Receipt> _receipts = [];

  List<Receipt> get receipts => _receipts;

  Future<void> fetchReceipts() async {
    try {
      _receipts = await InvoiceAPI.instance.getAllInvoices();
      notifyListeners();
    } catch (e) {
      // handle error
    }
  }
}