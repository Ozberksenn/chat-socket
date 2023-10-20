import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opex/utils/utils.dart';

Widget disabledButton({String? alert}) {
  return InkWell(
    onTap: () {
      showAlert(alert ?? '');
    },
    child: Container(
      margin: const EdgeInsets.all(8.0),
      width: Get.width,
      height: 48,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(12.0)),
      child: const Center(
          child: Text(
        'Join The Rooms',
        style: TextStyle(color: Colors.white),
      )),
    ),
  );
}
