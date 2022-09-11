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
        ],
      ),
    );
  }
}
