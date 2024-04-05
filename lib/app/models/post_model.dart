import 'package:enviroplus/app/models/user_post_model.dart';

class PostModel {
  String? id;
  String? title;
  double? price;
  String? address;
  String? body;
  String? imageUrl;
  UserPostModel? userPost;
  DateTime? createdAt;
  DateTime? updatedAt;

  PostModel({
    this.id,
    this.title,
    this.price,
    this.address,
    this.body,
    this.imageUrl,
    this.userPost,
    this.createdAt,
    this.updatedAt,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    price = double.parse(json['price'].toString());
    address = json['address'];
    body = json['body'];
    imageUrl = json['imageUrl'];
    userPost = UserPostModel.fromJson(json['user']);
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'price': price,
      'address': address,
      'body': body,
      'imageUrl': imageUrl,
      'user': userPost!.toJson(),
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}
