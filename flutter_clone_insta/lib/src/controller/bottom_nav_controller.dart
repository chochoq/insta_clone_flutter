import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_clone_insta/src/components/message_popup.dart';
import 'package:flutter_clone_insta/src/pages/upload.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavController extends GetxController {
  static BottomNavController get to => Get.find();
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];
  GlobalKey<NavigatorState> searchPageNaviKey = GlobalKey<NavigatorState>();

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
      // 사진 업로드 되는 페이지로 전환되어야함
      case PageName.UPLOAD:
        Get.to(() => Upload());
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    // print(bottomHistory);
    if (!hasGesture) return;
    if (bottomHistory.last != value) {
      bottomHistory.add(value);
      // print(bottomHistory);
    }
    // if (bottomHistory.contains(value)) {
    //   bottomHistory.remove(value);
    // }
  }

// 네비에서 뒤로가기 처리
  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      showDialog(
        context: Get.context!,
        builder: (context) => MessagePopup(
          message: '종료합니까?',
          okCallback: () {
            exit(0);
          },
          cancelCallback: Get.back,
        ),
      );
      return true;
    } else {
      var page = PageName.values[bottomHistory.last];
      if (page == PageName.SEARCH) {
        var value = await searchPageNaviKey.currentState!.maybePop();
        if (value) return false;
      }

      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      return false;
    }
  }
}
