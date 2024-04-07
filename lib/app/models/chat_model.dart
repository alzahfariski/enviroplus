class ChatModel {
  Receiver? receiver;
  String? content;
  String? sId;

  ChatModel({
    this.receiver,
    this.content,
    this.sId,
  });

  ChatModel.fromJson(Map<String, dynamic> json) {
    receiver = Receiver.fromJson(json['receiver']);
    content = json['content'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      "receiver": receiver!.toJson(),
      "content": content,
      "_id": sId,
    };
  }
}

class Receiver {
  String? username;
  String? avatarUrl;
  String? id;

  Receiver({
    this.username,
    this.avatarUrl,
    this.id,
  });

  Receiver.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    avatarUrl = json['avatarUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "avatarUrl": avatarUrl,
      "id": id,
    };
  }
}
