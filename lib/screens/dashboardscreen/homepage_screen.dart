// views/home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/bottomnavigation_controller.dart';


class HomeScreen extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  final List<IconData> bottomIcons = [
    Icons.home,
    Icons.explore,
    Icons.add_box,
    Icons.message,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  // const Icon(Icons.menu, color: Colors.blueAccent),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      controller.screenTitles[controller.selectedIndex.value],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search_outlined, color: Colors.grey),
                    onPressed: () {
                      // search action
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_none, color: Colors.grey),
                    onPressed: () {
                      // notification action
                    },
                  ),
                ],
              ),
            ),

            // Body Content
            Expanded(
              child: Center(
                child: Text(
                  controller.screenTitles[controller.selectedIndex.value],
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),

        // Bottom Navigation Bar
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(bottomIcons[0]), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(bottomIcons[1]), label: 'Clock'),
            BottomNavigationBarItem(icon: Icon(bottomIcons[2]), label: 'Add'),
            BottomNavigationBarItem(icon: Icon(bottomIcons[3]), label: 'Messages'),
            BottomNavigationBarItem(icon: Icon(bottomIcons[4]), label: 'Profile'),
          ],
        ),
      ),
    ));
  }

}


