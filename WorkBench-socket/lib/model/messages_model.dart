class MessagesModel {
  int messagesId;
  int roomID;
  String roomName;
  String sender;

  MessagesModel(
      {required this.messagesId,
      required this.roomID,
      required this.roomName,
      required this.sender});
}
