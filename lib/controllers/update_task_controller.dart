// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class UpdateTaskController extends GetxController {
//   var activePageIndex = 0.obs;
//   final ScrollController scrollController = ScrollController();
//
//   void setActivePage(int index) {
//     activePageIndex.value = index;
//   }
//
//   void toggleCheckbox(String value, RxList<String> list) {
//     if (list.contains(value)) {
//       list.remove(value);
//     } else {
//       list.add(value);
//     }
//     update();
//   }
//
//   void nextPage() {
//     if (activePageIndex.value < 3) {
//       activePageIndex.value++;
//       debugPrint(activePageIndex.value.toString());
//     }
//   }
//
//   void previousPage() {
//     if (activePageIndex.value > 0) {
//       activePageIndex.value--;
//       debugPrint(activePageIndex.value.toString());
//     }
//   }
// }
