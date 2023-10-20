import 'package:get/get.dart';

import '../../model/room_model.dart';
import '../../utils/app_routes.dart';

class RoomsController extends GetxController {
  int roomId = 1; // odaların id bilgisi burada tutuluyor.
  RxString roomName = ''.obs; // tıklanan odanın adı burada tutuluyorç

  void handleRoomCard(RoomModel value) {
    // rooms sayfasında ki bir room karta tıkladığımızda :
    roomId = value.roomId;
    roomName.value = value.roomName;
    Get.toNamed(AppRoutes.home);
  }
}
