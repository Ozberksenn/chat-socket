import 'package:flutter/material.dart';
import 'package:opex/pages/entry/entry_controller.dart';

import '../../../utils/configuration.dart';

Widget entryFormField(EntryController controller) {
  return TextFormField(
      controller: controller.entryInput,
      onChanged: (value) {
        controller.senderName.value = value;
      },
      decoration: InputDecoration(
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: black)),
          labelText: 'User Name ',
          labelStyle: TextStyle(color: black),
          border: const OutlineInputBorder()));
}
