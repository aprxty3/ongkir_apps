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
              popupProps: PopupProps.dialog(
                showSelectedItems: true,
                disabledItemFn: (String s) => s.startsWith('I'),
              ),
              items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
              onChanged: print,
              selectedItem: "Brazil",
            ),
            SizedBox(
              height: 16,
            ),
            DropdownSearch<String>.multiSelection(
              items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
              popupProps: PopupPropsMultiSelection.menu(
                showSelectedItems: true,
                disabledItemFn: (String s) => s.startsWith('I'),
              ),
              onChanged: print,
              selectedItems: ["Brazil"],
            )
          ],
        ));
  }
}
