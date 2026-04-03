import 'dart:convert';
import 'package:flutter/services.dart';

Future<List<Map<String, dynamic>>> loadJson() async {
  final String data = await rootBundle.loadString('lib/assets/data.json');
  final List<dynamic> jsonResult = jsonDecode(data);

  return jsonResult.cast<Map<String, dynamic>>();
}
