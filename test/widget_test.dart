import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ongkir_apps/app/data/models/user_models.dart';

void main() async {
  Uri url = Uri.parse('https://reqres.in/api/users/10');
  final res = await http.get(url);

  final user =
      UserModelsResponse.fromJson(jsonDecode(res.body) as Map<String, dynamic>);

  final data = user.data;
  final supp = user.support;

  print("${data.firstName} ${data.lastName}");
}
