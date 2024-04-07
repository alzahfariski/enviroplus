class NewChatModel {
  String? chatRoom;
  String? sender;
  String? content;
  String? sId;

  NewChatModel({
    this.chatRoom,
    this.sender,
    this.content,
    this.sId,
  });

  NewChatModel.fromJson(Map<String, dynamic> json) {
    chatRoom = json['chatRoom'];
    sender = json['sender'];
    content = json['content'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'chatRoom': chatRoom,
      'sender': sender,
      'content': content,
      '_id': sId,
    };
  }
}
