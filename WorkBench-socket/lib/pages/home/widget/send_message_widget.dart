import 'package:flutter/material.dart';
import 'package:opex/pages/home/home_controller.dart';
import '../../../utils/configuration.dart';

Widget sendMessage(HomeController controller) {
  return Container(
    margin: const EdgeInsets.only(top: 10, bottom: 40, left: 12.0, right: 12.0),
    child: SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: SizedBox(
                      child: TextFormField(
                          controller: controller.input,
                          onChanged: (value) {
                            controller.onChangeInput(value);
                          },
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: black)),
                              filled: true,
                              fillColor: Colors.white,
                              border: const OutlineInputBorder())))),
              InkWell(
                onTap: () {
                  controller.socketDataButton();
                },
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.send,
                      color: black,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
