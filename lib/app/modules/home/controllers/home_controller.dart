import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var hiddenKota = true.obs;
  var provinceId = 0.obs;
  var kotaAsalId = 0.obs;
  var hiddenKotaTujuan = true.obs;
  var provinceTujuanId = 0.obs;
  var kotaTujuanId = 0.obs;

  var beratC = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    beratC = TextEditingController();
    update();
  }

  @override
  void onClose() {
    super.onClose();
    beratC.dispose();
    update();
  }
}
