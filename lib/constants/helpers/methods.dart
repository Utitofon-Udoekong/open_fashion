import 'dart:convert';
import 'package:flutter/services.dart';

Future<List<dynamic>> readJsonFile(String filePath) async {
  final String response = await rootBundle.loadString(filePath);
  final List<dynamic> map = jsonDecode(response);
  return map;
}
