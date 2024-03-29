import 'package:get/get.dart';

class HoverController extends GetxController {
  var isHovered = false.obs;

  void setHovered(bool value) {
    isHovered.value = value;
  }
}