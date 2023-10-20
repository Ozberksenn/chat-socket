import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opex/data/data.dart';
import 'package:opex/pages/rooms/rooms_controller.dart';
import 'package:opex/widgets/app_bar_widget.dart';
import 'widget/room_card_widget.dart';

class RoomsView extends StatelessWidget {
  RoomsView({super.key});
  final RoomsController controller = Get.put(RoomsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(title: 'ROOMS'),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 222, 191, 97),
              child: GridView.builder(
                itemCount: roomData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return roomContainerWidget(
                      onTap: () {
                        controller.handleRoomCard(roomData[index]);
                      },
                      roomName: roomData[index].roomName);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
