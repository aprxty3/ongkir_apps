import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ongkir_apps/app/modules/home/province_model.dart';
import 'package:http/http.dart' as http;
import 'package:ongkir_apps/app/modules/home/views/widget/kota_widget.dart';
import 'package:ongkir_apps/app/modules/home/views/widget/province_widget.dart';

import '../city_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final int proveId;
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Ongkos Kirim'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ProvinsiWidget(),
          SizedBox(
            height: 16,
          ),
          Obx(() {
            return controller.hiddenKota.isTrue ? SizedBox() : KotaWidget(proveId: controller.provinceId.value);
          }),
        ],
      ),
    );
  }

  
}

