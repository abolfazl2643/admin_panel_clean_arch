import 'package:get/state_manager.dart';

class UploadImageController extends GetxController {
  var imagebyteCode = ''.obs;

  void getImage(String image) {
    imagebyteCode.value = image;
  }
}
