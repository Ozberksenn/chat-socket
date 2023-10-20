import 'package:flutter/material.dart';
import '../../../utils/configuration.dart';

Widget roomContainerWidget({required String roomName, Function? onTap}) {
  return InkWell(
    onTap: () => onTap!(),
    child: Container(
      margin: const EdgeInsets.all(12.0),
      width: 140,
      height: 140,
      decoration:
          BoxDecoration(color: black, borderRadius: BorderRadius.circular(18)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
              child: const Icon(
                Icons.meeting_room,
                color: Colors.black,
                size: 48,
              ),
            ),
            Text(
              roomName,
              style: bodyMediumWhite,
            ),
          ],
        ),
      ),
    ),
  );
}
