class RoomModel {
  int roomId;
  String roomName;
  int? iconId;

  RoomModel({required this.roomId, required this.roomName, this.iconId});

  factory RoomModel.fromMap(Map<String, dynamic> json) => RoomModel(
      roomId: json['ROOMID'],
      roomName: json['ROOMNAME'],
      iconId: json['ICONID']);
}
