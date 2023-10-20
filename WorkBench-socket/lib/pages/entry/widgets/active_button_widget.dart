import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opex/pages/entry/entry_controller.dart';
import 'package:opex/utils/configuration.dart';

Widget activeButton() {
  EntryController controller = Get.find();
  return InkWell(
    onTap: () {
      controller.activeButton();
    },
    child: Container(
      margin: const EdgeInsets.all(8.0),
      width: Get.width,
      height: 48,
      decoration: BoxDecoration(
          color: green, borderRadius: BorderRadius.circular(12.0)),
      child: const Center(
          child: Text(
        'Join The Rooms',
        style: TextStyle(color: Colors.white),
      )),
    ),
  );
}
