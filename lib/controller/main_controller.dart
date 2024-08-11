
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxString playingMedia = "".obs;
  RxDouble playerMinHeight = 60.0.obs;
}