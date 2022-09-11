
import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import '../../controllers/home_controller.dart';

import '../../province_model.dart';

class ProvinsiWidget extends GetView<HomeController> {
  const ProvinsiWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<Province>(

      showClearButton: true,
      onFind: (String filter) async {
        Uri url = Uri.parse("https://api.rajaongkir.com/starter/province");

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

          var listAllProvince = data["rajaongkir"]["results"] as List<dynamic>;
          var models = Province.fromJsonList(listAllProvince);
          return models;
        } catch (e) {
          print(e);
          return List<Province>.empty();
        }
      },
      popupItemBuilder: (context, item, isSelected) {
        return Container(
          margin: EdgeInsets.all(12),
          child: Text("${item.province}"),
        );
      },
      showSearchBox: true,
      itemAsString: (item) => item.province!,
      label: "Provisi Asal",
      hint: "Pilih Provinsi",
      onChanged: (prov) {
        if (prov != null) {
          controller.hiddenKota.value = false ;
          controller.provinceId.value = int.parse(prov.provinceId!);
        } else {
          controller.hiddenKota.value = true;
        }
      },
    );
  }
}
