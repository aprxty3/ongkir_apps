import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import '../../city_model.dart';
import '../../controllers/home_controller.dart';

class KotaWidget extends GetView<HomeController> {
  final int proveId;
  final String type;

  const KotaWidget({Key? key, required this.proveId, this.type = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: DropdownSearch<City>(
        onFind: (String filter) async {
          Uri url = Uri.parse(
              "https://api.rajaongkir.com/starter/city?province=$proveId");

          try {
            final res = await http.get(
              url,
              headers: {"key": "0ae702200724a396a933fa0ca4171a7e"},
            );

            var data = jsonDecode(res.body) as Map<String, dynamic>;

            var status = data["rajaongkir"]["status"]["code"];

            if (status != 200) {
              throw data["rajaongkir"]["status"]["description"];
            }

            var listAllCity = data["rajaongkir"]["results"] as List<dynamic>;
            var models = City.fromJsonList(listAllCity);
            return models;
          } catch (e) {
            print(e);
            return List<City>.empty();
          }
        },
        popupItemBuilder: (context, item, isSelected) {
          return Container(
            margin: EdgeInsets.all(12),
            child: Text("${item.type} ${item.cityName}"),
          );
        },
        showClearButton: true,
        showSearchBox: true,
        itemAsString: (item) => item.cityName!,
        label: type == 'asal' ? "Kota/Kabupaten Asal" : "Kota/Kabupaten Tujuan",
        hint: type == 'asal' ? "Kota/Kabupaten Asal" : "Kota/Kabupaten Tujuan",
        onChanged: (city) {
          if (city != null) {
            if (type == 'asal') {
              controller.kotaAsalId.value = int.parse(city.cityId!);
            } else {
              controller.kotaTujuanId.value = int.parse(city.cityId!);
            }
            controller.showButton();
          } else {
            if (type == 'asal') {
              print('ga pilih kota manapun');
              controller.kotaAsalId.value = 0;
            } else {
              print('ga pilih kota manapun');
              controller.kotaTujuanId.value = 0;
            }
          }
        },
      ),
    );
  }
}
