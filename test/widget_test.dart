import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse('https://reqres.in/api/users/2');
  final res = await http.get(url);

  print(res);
}
