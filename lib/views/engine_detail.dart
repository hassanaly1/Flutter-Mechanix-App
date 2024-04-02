import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/helpers/appbar.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/models/engine_model.dart';
import 'package:qr_flutter/qr_flutter.dart';

class EngineDetailScreen extends StatelessWidget {
  final EngineModel model;
  const EngineDetailScreen({super.key, required this.model});

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
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                        floating: true,
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.transparent,
                        forceMaterialTransparency: true,
                        expandedHeight: context.height * 0.15,
                        flexibleSpace: ListView(children: [
                          Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(children: [
                                ReUsableAppbar(
                                    title:
                                        "${model.name ?? 'No Name Specified'} (${model.type ?? 'No type Specified'})"),
                              ]))
                        ]))
                  ];
                },
                body: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: context.height * 0.02,
                      horizontal: context.width * 0.05),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(255, 220, 105, 0.4),
                        Color.fromRGBO(86, 127, 255, 0.4),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5.0,
                          spreadRadius: 5.0),
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: context.height * 0.1),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54)),
                        child: QrImageView(
                          data: model.name ?? '',
                          version: QrVersions.auto,
                          size: context.height * 0.3,
                          errorStateBuilder: (cxt, err) {
                            return Center(
                              child: CustomTextWidget(
                                text: 'Uh oh! Something went wrong...',
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                fontSize: 12.0,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: context.height * 0.02),
                      CustomTextWidget(
                        text: model.subtitle ?? '',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        fontSize: 16.0,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
