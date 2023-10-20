import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_routes.dart';

class EntryController extends GetxController {
  final entryInput = TextEditingController();
  RxString senderName = ''.obs;

  void activeButton() {
    Get.toNamed(AppRoutes.room);
    entryInput.clear();
  }
}
