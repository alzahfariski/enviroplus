class LevelModel {
  String? id;
  String? imageUrl;
  String? name;

  LevelModel({
    this.id,
    this.imageUrl,
    this.name,
  });

  LevelModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "imageUrl": imageUrl,
    };
  }
}
