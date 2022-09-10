import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ongkir_apps/app/data/models/user_models.dart';

void main() async {
  Uri url = Uri.parse('https://api.rajaongkir.com/starter/province');
  final res = await http.get(
    url,
    headers: {"key": "cf627e9dd6601da74350c46ab1f2c853"},
  );

  print(res.body);
}
