import 'package:get/state_manager.dart';

class SelectedImageController extends GetxController {
  var byteImage = ''.obs;

  void setImage(String image) {
    byteImage.value = image;
  }
}
