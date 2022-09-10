import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
            DropdownSearch<String>(
              mode: Mode.MENU,
              showClearButton: true,
              showSearchBox: true,
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
              label: "Provisi Asal",
              hint: "Pilih Provinsi",
              onChanged: (value) => print(value),
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
