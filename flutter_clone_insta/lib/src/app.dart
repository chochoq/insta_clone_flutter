import 'package:flutter/material.dart';
import 'package:flutter_clone_insta/src/components/image_data.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/state_manager.dart';

import 'controller/bottom_nav_controller.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Obx(
          () => Scaffold(
            appBar: AppBar(),
            body: IndexedStack(
              index: controller.pageIndex.value,
              children: [
                Container(
                  child: Center(
                    child: Text('HOME'),
                  ),
                ),
                Container(
                  child: Center(child: Text('SEARCH')),
                ),
                Container(
                  child: Center(child: Text('UPLOAD')),
                ),
                Container(
                  child: Center(child: Text('ACTIVITY')),
                ),
                Container(
                  child: Center(child: Text('MYPAGE')),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: controller.pageIndex.value,
              elevation: 0,
              onTap: controller.changeBottomNav,
              items: [
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.homeOff),
                  activeIcon: ImageData(IconsPath.homeOn),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.searchOff),
                  activeIcon: ImageData(IconsPath.searchOn),
                  label: 'search',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.uploadIcon),
                  activeIcon: ImageData(IconsPath.uploadIcon),
                  label: 'upload',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.activeOff),
                  activeIcon: ImageData(IconsPath.activeOn),
                  label: 'active',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green[200],
                    ),
                  ),
                  activeIcon: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green[300],
                    ),
                  ),
                  label: 'home',
                ),
              ],
            ),
          ),
        ),
        onWillPop: controller.wilPopAction);
  }
}
