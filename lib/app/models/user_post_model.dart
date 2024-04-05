class UserPostModel {
  String? id;
  String? username;

  UserPostModel({
    this.id,
    this.username,
  });

  UserPostModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "username": username,
    };
  }
}
