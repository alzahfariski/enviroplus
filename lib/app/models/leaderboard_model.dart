class LeaderboardModel {
  String? id;
  String? username;
  String? avatarUrl;
  int? point;

  LeaderboardModel({
    this.id,
    this.username,
    this.avatarUrl,
    this.point,
  });

  LeaderboardModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    point = int.parse(json['point'].toString());
    avatarUrl = json['avatarUrl'];
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "username": username,
      "point": point,
      "avatarUrl": avatarUrl,
    };
  }
}
