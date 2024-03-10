import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  RxInt currentPageIndex = 0.obs;
  RxBool isLastPage = false.obs;

  void updatePageIndicator(index) {
    currentPageIndex.value = index;
    if (currentPageIndex.value == 2) {
      isLastPage.value = true;
    } else {
      isLastPage.value = false;
    }
  }

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      currentPageIndex = 0.obs;
      pageController.jumpToPage(currentPageIndex.value);
    } else {
      currentPageIndex += 1;
      pageController.jumpToPage(currentPageIndex.value);
    }
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
