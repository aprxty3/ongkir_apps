import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ongkir_apps/app/modules/home/views/widget/kota_widget.dart';
import 'package:ongkir_apps/app/modules/home/views/widget/province_widget.dart';
import 'package:ongkir_apps/app/modules/home/views/widget/weight_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Ongkos Kirim'),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ProvinsiWidget(
            type: 'asal',
          ),
          Obx(() {
            return controller.hiddenKota.isTrue
                ? SizedBox()
                : KotaWidget(
                    proveId: controller.provinceId.value,
                    type: 'asal',
                  );
          }),
          ProvinsiWidget(
            type: 'tujuan',
          ),
          Obx(() {
            return controller.hiddenKotaTujuan.isTrue
                ? SizedBox()
                : KotaWidget(
                    proveId: controller.provinceId.value,
                    type: 'tujuan',
                  );
          }),
          BeratWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 50),
            child: DropdownSearch<Map<String, dynamic>>(
              mode: Mode.MENU,
              showClearButton: true,
              items: [
                {
                  "code": "jne",
                  "name": "Jalur Nugraha Ekakurir (JNE)",
                },
                {
                  "code": "pos",
                  "name": "Perusahaan Opsional Surat (POS)",
                },
                {
                  "code": "tiki",
                  "name": "Titipan Kilat (TIKI)",
                }
              ],
              popupItemBuilder: (context, item, isSelected) {
                return Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    '${item['name']}',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              },
              itemAsString: (item) => ,
              onChanged: (value) => print(value),
              label: 'Pilih Kurir',
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Cek Ongkos Kirim'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20),
              backgroundColor: Colors.red[900],
            ),
          ),
        ],
      ),
    );
  }
}
