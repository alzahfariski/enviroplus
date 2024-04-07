class LevelDetailModel {
  String? sId;
  String? imageUrl;
  String? name;
  String? description;
  List<Questions>? questions;

  LevelDetailModel({
    this.sId,
    this.imageUrl,
    this.name,
    this.description,
    this.questions,
  });

  LevelDetailModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    description = json['description'];
    if (json['questions'] != null) {
      questions = List<Questions>.from(
          json['questions'].map((question) => Questions.fromJson(question)));
    }
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': sId,
      'imageUrl': imageUrl,
      'name': name,
      'description': description,
      'questions': questions,
    };
  }
}

class Questions {
  String? text;
  List<String>? answers;
  String? sId;

  Questions({this.text, this.answers, this.sId});

  Questions.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    answers = json['answers'].cast<String>();
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'answers': answers,
      '_id': sId,
    };
  }
}
