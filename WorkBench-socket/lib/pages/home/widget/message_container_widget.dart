import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opex/pages/home/home_controller.dart';
import 'package:opex/utils/configuration.dart';

Widget messageContainer(int index) {
  HomeController controller = Get.find();
  return index % 2 == 0
      ? Container(
          margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
          decoration: BoxDecoration(
              color: Colors.white60, borderRadius: BorderRadius.circular(6.0)),
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              const Icon(Icons.arrow_right),
              Expanded(
                child: SizedBox(
                  child: Text(
                    "${controller.messages[index]['sender']} : ${controller.messages[index]['messages']} ",
                    style: Get.textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        )
      : Container(
          margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
          decoration: BoxDecoration(
              color: Colors.grey.shade700,
              borderRadius: BorderRadius.circular(6.0)),
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              const Icon(
                Icons.arrow_right,
                color: Colors.white,
              ),
              Expanded(
                child: SizedBox(
                  child: Text(
                      "${controller.messages[index]['sender']} : ${controller.messages[index]['messages']} ",
                      style: bodyMediumWhite),
                ),
              ),
            ],
          ),
        );
}
