import 'dart:io';

class NewPostModel {
  String? title;
  String? price;
  String? bodys;
  String? addres;
  File? image;

  NewPostModel({
    this.title,
    this.price,
    this.bodys,
    this.addres,
    this.image,
  });

  NewPostModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    bodys = json['body'];
    addres = json['addres'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "price": price,
      "body": bodys,
      "addres": addres,
      "image": image,
    };
  }
}
