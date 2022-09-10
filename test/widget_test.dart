import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ongkir_apps/app/data/models/user_models.dart';

void main() async {
  Uri url = Uri.parse('https://reqres.in/api/users');
  final res = await http.post(url, body: {
    "name": "Aji Prasetyo",
    "job": "Flutter Dev",
  });

  print(res.body);
}
