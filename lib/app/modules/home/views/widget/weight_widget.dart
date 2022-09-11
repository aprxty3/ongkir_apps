import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';

class BeratWidget extends GetView<HomeController> {
  const BeratWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            autocorrect: false,
            controller: controller.beratC,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onChanged: (value) => print(value),
            decoration: InputDecoration(
              labelText: 'Berat Barang',
              hintText: 'Masukan Berat Barang',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: 150,
          child: DropdownSearch<String>(
            mode: Mode.BOTTOM_SHEET,
            showSelectedItem: true,
            showSearchBox: true,
            searchBoxDecoration: InputDecoration(
              hintText: 'Cari Satuan berat',
              border: OutlineInputBorder(),
            ),
            items: [
              'ton',
              'kwintal',
              'ons',
              'lbs',
              'pound',
              'kg',
              'hg',
              'dag',
              'gram',
              'dg',
              'cg',
              'mg'
            ],
            label: 'Satuan',
            onChanged: print,
            selectedItem: "kg",
          ),
        )
      ],
    );
  }
}
