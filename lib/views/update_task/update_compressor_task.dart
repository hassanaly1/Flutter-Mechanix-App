import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/compressor_task_controller.dart';
import 'package:mechanix/helpers/appbar.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/models/compressor_model.dart';
import 'package:mechanix/views/add_task/compressor_task/cusom_compressor_body.dart';

class UpdateCompressorTaskScreen extends StatefulWidget {
  final CompressorTaskModel model;

  const UpdateCompressorTaskScreen({super.key, required this.model});

  @override
  State<UpdateCompressorTaskScreen> createState() =>
      _UpdateCompressorTaskScreenState();
}

class _UpdateCompressorTaskScreenState
    extends State<UpdateCompressorTaskScreen> {
  late CompressorTaskController controller;

  @override
  void initState() {
    controller = Get.put(CompressorTaskController());
    controller.updateControllers(widget.model);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/home-bg.png', fit: BoxFit.cover),
          GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: NestedScrollView(
                // controller: controller.scrollController,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                        floating: true,
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.transparent,
                        forceMaterialTransparency: true,
                        expandedHeight: context.height * 0.15,
                        flexibleSpace: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: ReUsableAppbar(title: 'Update Task')))
                  ];
                },
                body: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: CustomCompressorBody1(isTaskUpdating: false),
                        ),
                      ],
                    )),
              ),
              floatingActionButton: FloatingActionButton(
                // onPressed: () => controller.scrollUp(),
                onPressed: () {},
                backgroundColor: AppColors.primaryColor,
                mini: true,
                shape: const CircleBorder(),
                child: const Icon(Icons.arrow_upward_rounded),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
