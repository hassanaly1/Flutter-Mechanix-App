import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/helpers/storage_helper.dart';
import 'package:mechanix/models/compressor_model.dart';

class CompressorTaskController extends GetxController {
  void addCompressorTask() {
    var compressorTask = Compressor(
        // compressor: ,
        user: storage.read('user_info')['_id'],
        make: make.text.trim(),
        model: model.text.trim(),
        crossHeadShoes: crossheadShoes.text.trim(),
        mainBearing: mainBearings.text.trim(),
        connRodBearings: connRodBearings.text.trim(),
        crossHeadPinThruBolt: crossHeadPinthruBolt.text.trim(),
        spacerBarBolts: spacerBarBolts.text.trim(),
        crossHeadGuideToCrankcase: crossHeadGuideToCrankcase.text.trim(),
        crossHeadGuideToCyl: crossheadGuideToCyl.text.trim(),
        rodPackingBolt: rodPackingBolts.text.trim(),
        pistonNut: pistonNut.text.trim(),
        crossHeadNut: crossheadNut.text.trim(),
        connRadBushing: connRodBushing.text.trim(),
        babbit: babbit.text.trim(),
        bronze: bronze.text.trim(),
        castIron: castIron.text.trim(),
        connRodSideClearance: connRodSideClearance.text.trim(),
        mainRodSideClearance: mainBearingClearance.text.trim(),
        pistonEndCleareance: pistonEndClearance.text.trim(),
        connRoadBearingClearance: connRodBearingClearance.text.trim(),
        rodPackingSideClearance: rodPackingSideClearance.text.trim(),
        clearanceBronze: bronze2.text.trim(),
        teflon: teflon.text.trim(),
        crankstaftEndClearance: crankshaftEndClearance.text.trim(),
        compressorOilPressure: compressorOilPressure.text.trim(),
        valveCaps: [
          ValveCap(name: '3/8"', type: valueOf3By8.value, size: '3/8"'),
          ValveCap(name: '7/16"', type: valueOf7By16.value, size: '7/16"'),
          ValveCap(name: '1/2"', type: valueOf1By2.value, size: '1/2"'),
          ValveCap(name: '5/8"', type: valueOf5By8.value, size: '5/8"'),
          ValveCap(name: '3/4"', type: valueOf3By4.value, size: '3/4"'),
          ValveCap(name: '7/8"', type: valueOf7By8.value, size: '7/8"'),
          ValveCap(name: '1"', type: valueOf1.value, size: '1"'),
          ValveCap(name: '1 1/8"', type: valueOf1_1By8.value, size: '1 1/8"'),
          ValveCap(name: '1 1/4"', type: valueOf1_1By4.value, size: '1 1/4"'),
          ValveCap(name: '1 3/8"', type: valueOf1_3By8.value, size: '1 3/8"'),
          ValveCap(name: '1 1/2"', type: valueOf1_1By2.value, size: '1 1/2"'),
          ValveCap(name: '1 3/4"', type: valueOf1_3By4.value, size: '1 3/4"'),
          ValveCap(name: '2"', type: valueOf2.value, size: '2"'),
        ]);
  }

  TextEditingController taskName = TextEditingController();
  TextEditingController customerEmail = TextEditingController();
  TextEditingController make = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController crossheadShoes = TextEditingController();
  TextEditingController mainBearings = TextEditingController();
  TextEditingController connRodBearings = TextEditingController();
  TextEditingController crossHeadPinthruBolt = TextEditingController();
  TextEditingController spacerBarBolts = TextEditingController();
  TextEditingController crossHeadGuideToCrankcase = TextEditingController();
  TextEditingController crossheadGuideToCyl = TextEditingController();
  TextEditingController rodPackingBolts = TextEditingController();
  TextEditingController pistonNut = TextEditingController();
  TextEditingController crossheadNut = TextEditingController();
  RxString valueOf3By8 = 'NF'.obs;
  RxString valueOf7By16 = 'NF'.obs;
  RxString valueOf1By2 = 'NF'.obs;
  RxString valueOf5By8 = 'NF'.obs;
  RxString valueOf3By4 = 'NF'.obs;
  RxString valueOf7By8 = 'NF'.obs;
  RxString valueOf1 = 'NF'.obs;
  RxString valueOf1_1By8 = 'NF'.obs;
  RxString valueOf1_1By4 = 'NF'.obs;
  RxString valueOf1_3By8 = 'NF'.obs;
  RxString valueOf1_1By2 = 'NF'.obs;
  RxString valueOf1_3By4 = 'NF'.obs;
  RxString valueOf2 = 'NF'.obs;
  TextEditingController connRodBushing = TextEditingController();
  TextEditingController babbit = TextEditingController();
  TextEditingController bronze = TextEditingController();
  TextEditingController castIron = TextEditingController();
  TextEditingController connRodSideClearance = TextEditingController();
  TextEditingController mainBearingClearance = TextEditingController();
  TextEditingController pistonEndClearance = TextEditingController();
  TextEditingController connRodBearingClearance = TextEditingController();
  TextEditingController rodPackingSideClearance = TextEditingController();
  TextEditingController bronze2 = TextEditingController();
  TextEditingController teflon = TextEditingController();
  TextEditingController crankshaftEndClearance = TextEditingController();
  TextEditingController compressorOilPressure = TextEditingController();
}
