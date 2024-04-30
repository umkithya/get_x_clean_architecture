import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  int i = 0;
  @override
  void onClose() {
    debugPrint("Closing");
    super.onClose();
  }
}
