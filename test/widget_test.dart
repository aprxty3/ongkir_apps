
import 'package:http/http.dart' as http;
import 'package:ongkir_apps/app/data/models/user_models.dart';

void main() async {
  Uri url = Uri.parse('https://api.rajaongkir.com/starter/cost');
  final res = await http.post(
    url,
    body: {
      "origin": "501",
      "destination": "114",
      "weight": "1700",
      "courier": "jne",
    },
    headers: {
      "key": "cf627e9dd6601da74350c46ab1f2c853",
      "content-type": "application/x-www-form-urlencoded",
    },
  );

  print(res.body);
}
