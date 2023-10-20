import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opex/model/room_model.dart';
import 'package:opex/pages/rooms/rooms_controller.dart';
import 'package:opex/utils/app_routes.dart';
import '../entry/entry_controller.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class HomeController extends GetxController {
  final EntryController entryController =
      Get.find(); // entry ekranında ki controller ı  çağırıyoruz.
  final RoomsController roomsController = Get.find();
  final input = TextEditingController();
  RxString messageValue = ''.obs;
  // room Info :
  RxString writing = ''.obs; // "yazıyor..." bilgisi burada tutuluyor.
  RxList<RxMap<String, dynamic>> messages = <RxMap<String, dynamic>>[].obs;
  final socket = IO.io('https://c2e1-88-226-100-247.ngrok-free.app', {
    'transports': ['websocket'],
    'autoConnect': false,
  });
  @override
  void onInit() {
    super.onInit();
    init();
  }

  void initSocket() {
    // Bağlantıyı başlat
    socket.connect();
  }

  void closeSocket() {
    // Bağlantıyı kapat
    socket.disconnect();
  }

  init() {
    initSocket();
    socket.onConnect((data) {
      debugPrint("bağlanan Id :  ${socket.id}");
      socket.emit('joinRoom', roomsController.roomId);
    });
    socket.on('chat', (data) {
      print(data);
      messages.add(RxMap.from(data));
      messageValue.value = '';
      writing.value = '';
      input.clear();
    });
    socket.on('typing', (data) {
      var senderName = data['senderName'];
      writing.value = '$senderName yazıyor...';
    });
    socket.onDisconnect((data) => {debugPrint(data)});
  }

  void handleRoomCard(RoomModel value) {
    // rooms sayfasında ki bir room karta tıkladığımızda :
    roomsController.roomId = value.roomId;
    roomsController.roomName.value = value.roomName;
    socket.emit('joinRoom', value.roomId);
    Get.toNamed(AppRoutes.home);
  }

  void socketDataButton() {
    socket.emit('chat', {
      "tenant_id": roomsController.roomId,
      "messages": messageValue.value,
      "sender": entryController.senderName.value
    });
  }

  void onChangeInput(value) {
    // text field on change olduğunda çalışan fonksiyon.
    messageValue.value = value;
    if (value.length > 0) {
      socket.emit('typing', {
        "roomValue": roomsController.roomId,
        "senderName": entryController.senderName.value
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
    closeSocket();
  }
}
