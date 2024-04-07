import 'package:enviroplus/app/models/post_model.dart';
import 'package:enviroplus/app/services/chat_new_service.dart';
import 'package:enviroplus/app/services/post_service.dart';
import 'package:enviroplus/utils/loaders/loaders.dart';
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

  Future<bool> newChat({
    required String content,
    required String id,
  }) async {
    try {
      await NewChatService().newChat(content, id);

      update();
      return true;
    } catch (e) {
      return false;
    }
  }

  void handleNewChat(String id, String nama) async {
    try {
      await newChat(content: 'Saya tertarik dengan produk $nama', id: id);
      Get.back();
      TLoaders.successSnackBar(
          title: 'Berhasil!', message: 'Silahkan cek di Chat');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'ada kesalahan !', message: e.toString());
    }
  }
}
