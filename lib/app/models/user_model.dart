class UserModel {
  String? id;
  String? username;
  String? name;
  String? email;
  String? avatarUrl;
  String? work;
  String? token;

  UserModel({
    this.id,
    this.username,
    this.name,
    this.email,
    this.avatarUrl,
    this.work,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    avatarUrl = json['avatarUrl'];
    work = json['work'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "name": name,
      "email": email,
      "avatarUrl": avatarUrl,
      "work": work,
      "token": token,
    };
  }
}
