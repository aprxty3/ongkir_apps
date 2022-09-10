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
              items: [
                "Jateng",
                "DIY (Jatim)",
                "Banten",
                'DKI Jakarta',
                'Jabar'
              ],
              dropdownSearchDecoration: InputDecoration(
                labelText: "Provisi",
                hintText: "Pilih Provinsi",
              ),
              onChanged: print,
              selectedItem: "Brazil",
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ));
  }
}
