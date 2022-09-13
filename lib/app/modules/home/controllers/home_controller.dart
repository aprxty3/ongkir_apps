import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ongkir_apps/app/modules/home/courier_model.dart';

class HomeController extends GetxController {
  var hiddenKota = true.obs;
  var provinceId = 0.obs;
  var kotaAsalId = 0.obs;
  var hiddenKotaTujuan = true.obs;
  var provinceTujuanId = 0.obs;
  var kotaTujuanId = 0.obs;
  var hiddenButton = true.obs;
  var kurir = ''.obs;

  double berat = 0.0;
  String satuan = 'gram';

  late TextEditingController beratC;

  void ongkosKirim() async {
    Uri url = Uri.parse('https://api.rajaongkir.com/starter/cost');
    showButton();
    try {
      final res = await http.post(
        url,
        body: {
          "origin": "$kotaAsalId",
          "destination": "$kotaTujuanId",
          "weight": "$berat",
          "courier": "$kurir",
        },
        headers: {
          "key": "cf627e9dd6601da74350c46ab1f2c853",
          "content-type": "application/x-www-form-urlencoded",
        },
      );
      var data = json.decode(res.body) as Map<String, dynamic>;
      var results = data["rajaongkir"]["results"] as List<dynamic>;

      var listCourier = Courier.fromJsonList(results);
      var courier = listCourier[0];
      Get.defaultDialog(
        title: courier.name,
        content: Column(
          children: courier.costs
              .map(
                (e) => ListTile(
                  title: Text('${e.service}'),
                  subtitle: Text('${e.cost[0].value}'),
                  trailing: Text('${e.cost[0].etd}'),
                ),
              )
              .toList(),
        ),
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: 'terjadi kesalahan',
        middleText: e.toString(),
      );
    }
  }

  void ubahBerat(String value) {
    berat = double.tryParse(value) ?? 0.0;
    String cekSatuan = satuan;
    switch (cekSatuan) {
      case "ton":
        berat = berat * 1000000;
        break;
      case "kwintal":
        berat = berat * 100000;
        break;
      case "ons":
        berat = berat * 100;
        break;
      case "lbs":
        berat = berat * 2204.62;
        break;
      case "pound":
        berat = berat * 2204.62;
        break;
      case "kg":
        berat = berat * 1000;
        break;
      case "hg":
        berat = berat * 100;
        break;
      case "dag":
        berat = berat * 10;
        break;
      case "gram":
        berat = berat;
        break;
      case "dg":
        berat = berat / 10;
        break;
      case "cg":
        berat = berat / 100;
        break;
      case "mg":
        berat = berat / 1000;
        break;
      default:
        berat = berat;
    }
    print("$berat gram");
    showButton();
  }

  void ubahSatuan(String value) {
    berat = double.tryParse(beratC.text) ?? 0.0;
    switch (value) {
      case "ton":
        berat = berat * 1000000;
        break;
      case "kwintal":
        berat = berat * 100000;
        break;
      case "ons":
        berat = berat * 100;
        break;
      case "lbs":
        berat = berat * 2204.62;
        break;
      case "pound":
        berat = berat * 2204.62;
        break;
      case "kg":
        berat = berat * 1000;
        break;
      case "hg":
        berat = berat * 100;
        break;
      case "dag":
        berat = berat * 10;
        break;
      case "gram":
        berat = berat;
        break;
      case "dg":
        berat = berat / 10;
        break;
      case "cg":
        berat = berat / 100;
        break;
      case "mg":
        berat = berat / 1000;
        break;
      default:
        berat = berat;
    }
    satuan = value;
    print("$berat gram");
    showButton();
  }

  void showButton() {
    if (kotaAsalId != 0 && kotaTujuanId != 0 && berat > 0 && kurir != '') {
      hiddenButton.value = false;
    } else {
      hiddenButton.value = true;
    }
  }

  @override
  void onInit() {
    super.onInit();
    beratC = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    beratC.dispose();
  }
}
