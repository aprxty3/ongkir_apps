import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ongkir_apps/app/data/models/user_models.dart';

void main() async {
  Uri url = Uri.parse('https://api.rajaongkir.com/starter/province');
  final res =
      await http.get(url, headers: {"key": "c260d509530ff505c32408a7418c79bb"});

  print(res.body);
}
