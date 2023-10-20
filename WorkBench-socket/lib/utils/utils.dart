import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

bool parseBool(String? value) {
  return value == null ? false : value.toLowerCase() == 'true';
}

bool toBool(bool? value) {
  return value ?? false;
}

int toInt(dynamic value) {
  if (value == null || value == "") return 0;
  try {
    return int.parse(value.toString());
  } catch (error) {
    return 0;
  }
}

String toTime(DateTime value) {
  try {
    final dateFormatter = DateFormat('HH:mm');
    final dateString = dateFormatter.format(value);
    return dateString;
  } catch (e) {
    return "";
  }
}

String toSqlDate(DateTime value) {
  try {
    final dateFormatter = DateFormat('yyyy-MM-dd');
    final dateString = dateFormatter.format(value);
    return dateString;
  } catch (e) {
    return "";
  }
}

String formatDate(DateTime? value) {
  try {
    if (value == null) {
      return "";
    } else {
      return DateFormat.yMd().format(value);
    }
  } catch (e) {
    return "";
  }
}

String formatDateTime(DateTime? value) {
  try {
    if (value == null) {
      return "";
    } else {
      return DateFormat.yMd().add_Hm().format(value);
    }
  } catch (e) {
    return "";
  }
}

parseDate(value) {
  try {
    if (value is DateTime) {
      return DateFormat.yMd().format(value);
    } else {
      DateTime d = DateTime.parse(value);
      return DateFormat.yMd().format(d);
    }
  } catch (e) {
    return null;
  }
}

parseTime(value) {
  try {
    DateTime d = DateTime.parse(value);
    return DateFormat('HH:mm').format(d);
  } catch (e) {
    return null;
  }
}

parseDateTime(value) {
  try {
    DateTime d = DateTime.parse(value);
    return DateFormat.yMd().add_Hm().format(d);
  } catch (e) {
    return null;
  }
}

showSnackBar(String title, String message) {
  Get.snackbar(
    title.tr,
    message.tr,
    snackPosition: SnackPosition.BOTTOM,
  );
}

showWarning(String message) {
  Get.snackbar('Error', message,
      colorText: Colors.white, backgroundColor: Colors.red.withOpacity(0.8));
}

showSuccess(String message) {
  Get.snackbar('Success', message,
      colorText: Colors.white, backgroundColor: Colors.green.withOpacity(0.8));
}

showAlert(String message) {
  Get.snackbar(
    "Alert".tr,
    message.tr,
    backgroundColor: Colors.red[200],
    snackPosition: SnackPosition.TOP,
  );
}

closeOpenedDialog() {
  if (Get.isBottomSheetOpen ?? false) Get.back();
  if (Get.isSnackbarOpen) Get.back();
  if (Get.isDialogOpen ?? false) Get.back();
}

showDefaultDialog(String title, String message) {
  closeOpenedDialog();
  Get.defaultDialog(title: title.tr, content: Text(message.tr));
}

showContentDialog(String title, Widget content) {
  closeOpenedDialog();
  Get.defaultDialog(title: title.tr, content: content, barrierDismissible: true

      // DropdownButton(
      //     dropdownColor: Colors.white,
      //     style: TextStyle(color: Colors.black87),
      //     value: 0,
      //     items: [
      //       DropdownMenuItem(
      //         child: Text("New"),
      //         value: 0,
      //       ),
      //       DropdownMenuItem(
      //         child: Text("Importance"),
      //         value: 1,
      //       ),
      //     ],
      //     onChanged: (value) {}),
      );
}

showErrorDialog(String title, String message) async {
  closeOpenedDialog();
  await Get.defaultDialog(
    title: title.tr,
    //barrierDismissible: false,
    content: Column(children: <Widget>[
      const SizedBox(height: 250, width: 250, child: Text('show error dialog')),
      Container(
        padding: const EdgeInsets.all(8),
        child: greyline(),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(message, textAlign: TextAlign.center),
      ),
    ]),
    //onConfirm: onConfirm,
    //onCancel: () => {Get.back()},
  );
}

Widget greyline() {
  return Divider(
    color: Colors.grey[500],
  );
}

showSuccessDialog(String title, String message) async {
  closeOpenedDialog();
  await Get.defaultDialog(
    title: title.tr,
    content: Column(children: <Widget>[
      Text(message.tr),
    ]),
    //onConfirm: onConfirm,
    //onCancel: () => {Get.back()},
  );
}

// showConfirmDialog(String title, String message, dynamic onConfirm) {
//   closeOpenedDialog();
//   Get.defaultDialog(
//       title: title.tr,
//       content: Column(children: <Widget>[
//         SizedBox(
//           height: 200,
//           width: 200,
//           child: Lottie.asset('assets/lottie/confirm.json', fit: BoxFit.cover),
//         ),
//         Text(message.tr),
//       ]),
//       //onConfirm: onConfirm,
//       //onCancel: () => Get.back(),
//       confirm: InkWell(
//           onTap: onConfirm,
//           child: smallColoredButton(FontAwesomeIcons.thumbsUp)),
//       cancel: InkWell(
//           onTap: () => Get.back(),
//           child: smallColoredButton(FontAwesomeIcons.xmark)));
// }

// Widget showBusyIndicator() {
//   return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         //const SizedBox(height: 150),
//         CircularProgressIndicator(
//           strokeWidth: 10,
//           backgroundColor: kPrimaryColor,
//           valueColor: const AlwaysStoppedAnimation(Colors.black54),
//         ),
//         const SizedBox(height: 10),
//         Align(
//           alignment: Alignment.center,
//           child: Text("Loading".tr, style: subtitle1),
//         )
//       ]);

//   // return Expanded(
//   //     child: Center(
//   //         child: CircularProgressIndicator(
//   //   strokeWidth: 10,
//   //   backgroundColor: kPrimaryColor,
//   //   valueColor: const AlwaysStoppedAnimation(Colors.black54),
//   // )));
// }

// Future openBottomSheet(Widget child, String? title) {
//   return Get.bottomSheet(
//       Wrap(spacing: 12, children: <Widget>[
//         const SizedBox(height: 12),
//         Align(
//             alignment: Alignment.center,
//             child: Container(height: 2, width: 50, color: grey)),
//         const SizedBox(height: 12),
//         title == null
//             ? Container()
//             : Align(
//                 alignment: Alignment.center,
//                 child: AutoSizeText(title.tr,
//                     style: Get.textTheme.titleLarge,
//                     maxLines: 1,
//                     minFontSize: 10)),
//         child,
//         const SizedBox(height: 50),
//       ]),
//       isScrollControlled: true,
//       backgroundColor: Colors.white,
//       elevation: 4,
//       enterBottomSheetDuration: const Duration(milliseconds: 600),
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ));
// }

// openBottomSheetMax(Widget child, String? title, {Color? color}) {
//   Get.bottomSheet(
//       SizedBox(
//           height: Get.size.height * 0.8,
//           child: Column(children: <Widget>[
//             const SizedBox(height: 12),
//             Align(
//                 alignment: Alignment.center,
//                 child: Container(height: 2, width: 50, color: grey)),
//             const SizedBox(height: 12),
//             title == null
//                 ? Container()
//                 : Align(
//                     alignment: Alignment.center,
//                     child: Text(title.tr, style: Get.textTheme.titleLarge)),
//             const SizedBox(height: 12),
//             Expanded(child: SingleChildScrollView(child: child)),
//             const SizedBox(height: 50),
//           ])),
//       isScrollControlled: true,
//       backgroundColor: color ?? Colors.white,
//       elevation: 4,
//       enterBottomSheetDuration: const Duration(milliseconds: 600),
//       shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(top: Radius.circular(20))));
// }

// openImage(String? url) {
//   if (url == null || url == "") {
//     showErrorDialog("Error", "Empty url");
//     return;
//   }
//   openBottomSheet(
//       Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Align(
//             alignment: Alignment.center,
//             child: Hero(
//               tag: url,
//               child: InteractiveViewer(
//                 panEnabled: true, // Set it to false
//                 boundaryMargin: const EdgeInsets.all(0),
//                 minScale: 1,
//                 maxScale: 3,
//                 child: Image.network(
//                   url,
//                   width: Get.width * 0.80,
//                   //height: 200,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//           )),
//       "Image Preview");
// }

// openVideo(String? url) {
//   if (url == null || url == "") {
//     showErrorDialog("Error", "Empty url");
//     return;
//   }
//   openBottomSheet(VideoView(videoUrl: url, source: "network"), "Video Preview");
// }

// openAudio(String? url) {
//   if (url == null || url == "") {
//     showErrorDialog("Error", "Empty url");
//     return;
//   }
//   openBottomSheet(AudioView(url: url, source: "network"), "Listen");
// }

//NOtes
//\$ 745.00

Future<void> phoneCall(String phone) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phone,
  );
  if (!await launchUrl(launchUri)) {
    showErrorDialog("Launch Phone Error", "Could not call phone");
  }
}

Future<void> launchToUrl(String? url) async {
  if (url == null) {
    showErrorDialog("Launch Url Error", "Url is empty");
    return;
  }

  if (!await launchUrl(
    Uri.parse(url),
    mode: LaunchMode.externalApplication,
  )) {
    showErrorDialog("Launch Url Error", "Could not launch $url");
  }
}

Future<void> launchMap(String lat, String long) async {
  var mapSchema = '$lat,$long';
  if (Get.theme.platform == TargetPlatform.iOS) {
    mapSchema = 'http://maps.apple.com/?ll=$lat,$long'; //?q=${lat},${long}';
  } else {
    mapSchema =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long'; //'geo:$lat,$long';
  }
  if (!await launchUrl(Uri.parse(mapSchema),
      mode: LaunchMode.externalApplication)) {
    showAlert('Could not launch map');
  }
}

// Future<void> launchMap(String? lat, String? long) async {
//   if (lat == null || lat == "" || long == null || long == "") {
//     showErrorDialog("Error", "Empty url");
//     return;
//   }

//   var mapSchema = 'geo:$lat,$long';
//   if (Platform.isIOS) {
//     mapSchema = 'http://maps.apple.com/?q=${lat},${long}';
//   } else {
//     mapSchema =
//         'https://www.google.com/maps/search/?api=1&query=$lat,$long'; //'geo:$lat,$long';
//   }
//   if (await canLaunch(mapSchema)) {
//     await launch(mapSchema);
//   } else {
//     showAlert('Could not launch map');
//   }
// }

String escapedString(value) {
  return value
      .replaceAll('\n', '\\n')
      .replaceAll(r"\'", "\\'")
      //.replaceAll("\\"", "\"")
      .replaceAll(r"\&", "\\&")
      .replaceAll('\r', '\\r')
      .replaceAll("\t", "\\t")
      .replaceAll("\b", "\\b")
      .replaceAll("\f", "\\f");
}

String unEscapedString(value) {
  return value
      .replaceAll('\\n', '\n')
      .replaceAll("\\'", r"\'")
      //.replaceAll("\\"", "\"")
      .replaceAll("\\&", r"\&")
      .replaceAll('\\r', '\r')
      .replaceAll("\\t", "\t")
      .replaceAll("\\b", "\b")
      .replaceAll("\\f", "\f");
}
