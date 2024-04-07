class UserModel {
  String? id;
  String? username;
  String? name;
  String? email;
  String? avatarUrl;
  String? work;
  String? token;
  int? point;

  UserModel({
    this.id,
    this.username,
    this.name,
    this.email,
    this.avatarUrl,
    this.work,
    this.token,
    this.point,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    avatarUrl = json['avatarUrl'];
    work = json['work'];
    token = json['token'];
    point = int.parse(json['point'].toString());
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "username": username,
      "name": name,
      "email": email,
      "avatarUrl": avatarUrl,
      "work": work,
      "token": token,
      "point": point,
    };
  }
}
