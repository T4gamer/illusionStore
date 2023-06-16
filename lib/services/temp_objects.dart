import 'dart:convert';
import 'dart:io';

import '../models/Product.dart';

class TempObjectService {
  final String _filePath;

  TempObjectService(this._filePath);

  Future<void> saveObject(Product tempObject) async {
    final file = File(_filePath);
    final json = jsonEncode(tempObject.toJson());
    await file.writeAsString(json + '\n', mode: FileMode.append);
  }

  Future<List> readAllObjects() async {
    final file = File(_filePath);
    final lines = await file.readAsLines();
    return lines.map((line) => Product.fromJson(jsonDecode(line))).toList();
  }

  Future<Product?> fetchObjectById(String id) async {
    final file = File(_filePath);
    final lines = await file.readAsLines();
    final json = lines.firstWhere((line) => jsonDecode(line)['id'] == id, orElse: () => "");
    return json.isNotEmpty ? Product.fromJson(jsonDecode(json)) : null;
  }

  Future<Product?> fetchObjectByBarcode(int barcode) async {
    final file = File(_filePath);
    final lines = await file.readAsLines();
    final json = lines.firstWhere((line) => jsonDecode(line)['barcode'] == barcode, orElse: () => "");
    return json.isNotEmpty ? Product.fromJson(jsonDecode(json)) : null;
  }
}