class ChatRoom {
  Sender? sender;
  List<Messages>? messages;

  ChatRoom({this.sender, this.messages});

  ChatRoom.fromJson(Map<String, dynamic> json) {
    sender = Sender.fromJson(json['sender']);

    messages = <Messages>[];
    json['messages'].forEach((v) {
      messages!.add(Messages.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'messages': messages,
    };
  }
}

class Sender {
  String? sId;
  String? username;
  int? point;
  String? avatarUrl;

  Sender({this.sId, this.username, this.point, this.avatarUrl});

  Sender.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    point = json['point'];
    avatarUrl = json['avatarUrl'];
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': sId,
      'username': username,
      'point': point,
      'avatarUrl': avatarUrl,
    };
  }
}

class Messages {
  bool? isSender;
  String? chatRoom;
  String? content;

  Messages({
    this.isSender,
    this.chatRoom,
    this.content,
  });

  Messages.fromJson(Map<String, dynamic> json) {
    isSender = json['isSender'];
    chatRoom = json['chatRoom'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    return {
      'isSender': isSender,
      'chatRoom': chatRoom,
      'content': content,
    };
  }
}
