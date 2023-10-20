import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opex/pages/entry/entry_controller.dart';
import '../../widgets/app_bar_widget.dart';
import 'widgets/active_button_widget.dart';
import 'widgets/disabled_button_widget.dart';
import 'widgets/entry_form_field.dart';

class EntryView extends StatelessWidget {
  EntryView({super.key});
  final EntryController controller = Get.put(EntryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(title: 'CHATTING ROOM'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Please Can You Entry Name',
              style: Get.textTheme.bodyLarge,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: entryFormField(controller),
          ),
          Obx(() => controller.senderName.value.isNotEmpty
              ? activeButton()
              : disabledButton(alert: 'Please Can You Entry Name'))
        ],
      ),
    );
  }
}
