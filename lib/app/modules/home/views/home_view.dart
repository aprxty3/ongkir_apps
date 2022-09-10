import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ongkir_apps/app/modules/home/province_model.dart';
import 'package:http/http.dart' as http;

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Aplikasi Ongkos Kirim'),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            DropdownSearch<Province>(
              mode: Mode.MENU,
              showClearButton: true,
              showSearchBox: true,
              onFind: (String filter) async {
                var res = await http.get(
                  Uri.parse('https://api.rajaongkir.com/starter/province'),
                  headers: {"key": "c260d509530ff505c32408a7418c79bb"},
                );

                var data = jsonDecode(res.body) as Map<String, dynamic>;

                var listAllProvince =
                    data["rajaongkir"]["result"] as List<dynamic>;
                var models = Province.fromJsonList(listAllProvince);
                return models;
              },
              items: [],
              searchBoxDecoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  )),
              label: "Provisi Asal",
              hint: "Pilih Provinsi",
              onChanged: (data) => print(data),
            ),
            SizedBox(
              height: 16,
            ),
            DropdownSearch<String>(
              showClearButton: true,
              showSearchBox: true,
              mode: Mode.MENU,
              items: [
                "Jateng",
                "DIY (Jatim)",
                "Banten",
                'DKI Jakarta',
                'Jabar'
              ],
              searchBoxDecoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  )),
              label: "Kota Tujuan",
              hint: "Pilih Provinsi",
              onChanged: (value) => print(value),
            ),
          ],
        ));
  }
}
