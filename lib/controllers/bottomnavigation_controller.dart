import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  List<String> screenTitles = [
    "Home",
    "clock",
    "Add",
    "Messages",
    "Profile",
  ];
}
