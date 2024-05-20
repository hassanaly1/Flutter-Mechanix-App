// import 'package:energy_services/controllers/generator_task_controllers.dart';
// import 'package:energy_services/views/home/new_task/custom_stepperbody1.dart';
// import 'package:energy_services/views/home/new_task/custom_stepperbody2.dart';
// import 'package:energy_services/views/home/new_task/custom_stepperbody3.dart';
// import 'package:energy_services/views/home/new_task/custom_stepperbody4.dart';

// class StepperBody extends StatelessWidget {
//   const StepperBody({
//     super.key,
//     required this.controller,
//   });
//
//   final AddTaskController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => PageView(
//           physics: NeverScrollableScrollPhysics(),
//           controller: PageController(
//             initialPage: controller.activePageIndex.value,
//           ),
//           onPageChanged: (index) => controller.setActivePage(index),
//           children: [
//             CustomStepperBody1(),
//             CustomStepperBody2(),
//             CustomStepperBody3(),
//             CustomStepperBody4(),
//           ],
//         ));
//   }
// }
