import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse('https://reqres.in/api/users/2');
  final res = await http.get(url);

  final data = (jsonDecode(res.body) as Map<String, dynamic>)["data"];

  print(data["first_name"] + " " + data["last_name"]);
}
