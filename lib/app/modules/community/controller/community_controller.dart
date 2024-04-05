import 'package:enviroplus/app/models/post_model.dart';
import 'package:enviroplus/app/services/post_service.dart';
import 'package:get/get.dart';

class CommunityController extends GetxController {
  static CommunityController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    getPost();
  }

  List<PostModel> _posts = [];

  List<PostModel> get post => _posts;

  set post(List<PostModel> post) {
    _posts = post;
    update();
  }

  Future<void> getPost() async {
    try {
      List<PostModel> posts = await PostService().getPost();
      _posts = posts;
    } catch (e) {
      throw Exception(e);
    }
  }
}
