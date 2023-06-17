import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;


import '../models/Product.dart';

class TempObjectService {
  static const String _fileName = 'temp.json';
  static final String _filePath = path.join(
    Directory.current.path,
    'models',
    _fileName,
  );
  static TempObjectService? _instance;

  factory TempObjectService() {
    if (_instance == null) {
      _instance = TempObjectService._internal();
    }
    return _instance!;
  }

  TempObjectService._internal();

  Future<void> saveObject(Product tempObject) async {
    final file = File(_filePath);
    print(tempObject.toJson());
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