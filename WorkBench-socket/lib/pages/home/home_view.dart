import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opex/pages/home/home_controller.dart';
import 'package:opex/pages/rooms/rooms_controller.dart';
import 'package:opex/widgets/app_bar_widget.dart';
import 'widget/message_container_widget.dart';
import 'widget/send_message_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController());
  final RoomsController roomController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: appBarWidget(title: roomController.roomName.value),
        body: Column(
          children: [
            Expanded(
              child: Container(
                  color: Colors.blueGrey,
                  child: Obx(() => ListView(children: [
                        SizedBox(
                          child: Text(
                            controller.writing.value,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          child: ListView.builder(
                            reverse: true,
                            shrinkWrap: true,
                            itemCount: controller.messages.length,
                            itemBuilder: (context, index) {
                              return messageContainer(index);
                            },
                          ),
                        ),
                      ]))),
            ),
            sendMessage(controller)
          ],
        ));
  }
}
