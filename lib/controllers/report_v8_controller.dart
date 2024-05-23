import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/universal_controller.dart';

class ReportV8Controller extends GetxController {
  RxBool isLoading = false.obs;

  // RxInt numberOfControllers = 0.obs;
  final UniversalController universalController = Get.find();

  @override
  onInit() {
    debugPrint(
        'NumberOfControllersAtInit: ${universalController.numberOfControllers.value}');
    for (int i = 0; i < universalController.numberOfControllers.value; i++) {
      engineBlocIndicateWhichOneCtrl.add(TextEditingController());
      engineBlocIndicateWhichOneCtrl[i].text = i.toString();
    }
    for (int i = 0; i < universalController.numberOfControllers.value; i++) {
      engineCrankshaftIndicateWhichOneCtrl.add(TextEditingController());
    }
    for (int i = 0; i < universalController.numberOfControllers.value; i++) {
      connectingRodsIndicateWhichOneCtrl.add(TextEditingController());
    }
    for (int i = 0; i < universalController.numberOfControllers.value; i++) {
      actualReadingsCtrl.add(TextEditingController());
    }
    for (int i = 0; i < universalController.numberOfControllers.value; i++) {
      pistonPinsIndicateNewPinsCtrl.add(TextEditingController());
    }
    for (int i = 0; i < universalController.numberOfControllers.value; i++) {
      indicateNewPistonsCtrl.add(TextEditingController());
    }

    ///todo: Assigning Controllers Remaining
    for (int i = 0; i < universalController.numberOfControllers.value; i++) {
      ringClearanceInLinersCtrl
          .add(List.generate(4, (_) => TextEditingController()));
    }

    print(ringClearanceInLinersCtrl.length);
    print(ringClearanceInLinersCtrl[0].length);

    ///todo: Assigning Controllers Remaining
    for (int i = 0; i < universalController.numberOfControllers.value; i++) {
      ringClearanceInPistonsCtrl.add(TextEditingController());
    }
    for (int i = 0; i < universalController.numberOfControllers.value; i++) {
      indicateNewCylinderLinersCtrl.add(TextEditingController());
    }
    for (int i = 0; i < universalController.numberOfControllers.value; i++) {
      indicateCylinderHeadsCtrl.add(TextEditingController());
    }
    for (int i = 0; i < universalController.numberOfControllers.value; i++) {
      indicateRocketShaftAssembliesCtrl.add(TextEditingController());
    }
    for (int i = 0; i < universalController.numberOfControllers.value; i++) {
      injectorTrimCodesCtrl.add(TextEditingController());
    }
    super.onInit();
  }

  TextEditingController customerName = TextEditingController();
  TextEditingController workOrder = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController lsd = TextEditingController();
  TextEditingController unitNumber = TextEditingController();
  TextEditingController unitHours = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController customerContact = TextEditingController();
  TextEditingController engineMake = TextEditingController();
  TextEditingController engineModel = TextEditingController();
  TextEditingController engineSerialNumber = TextEditingController();
  TextEditingController engineArrangementNumber = TextEditingController();
  TextEditingController mechanicName1 = TextEditingController();
  TextEditingController mechanicName2 = TextEditingController();

  ///----------------------Engine Block------------------------
  RxString engineBlock = 'NEW'.obs;
  RxString lineBorePerfumed = 'NEW'.obs;
  TextEditingController lineBorePerfumedCompany = TextEditingController();
  RxString magChecked = 'YES'.obs;
  TextEditingController magCheckedCompany = TextEditingController();
  RxString linerFitsRepaired = 'YES'.obs;
  TextEditingController linerFitsRepairedCompany = TextEditingController();
  List<TextEditingController> engineBlocIndicateWhichOneCtrl = [];

  ///----------------------Engine Crankshaft------------------------
  RxString engineCrankshaft = 'NEW'.obs;
  TextEditingController plastiGaugeSpecs = TextEditingController();
  TextEditingController plastiGaugeAnnual = TextEditingController();
  List<TextEditingController> engineCrankshaftIndicateWhichOneCtrl = [];
  TextEditingController endPlaySpecs = TextEditingController();
  TextEditingController endPlayAnnual = TextEditingController();
  RxString mainBearingsReplaced = 'YES'.obs;
  TextEditingController mainBearingsIfNotIndicateWhy = TextEditingController();
  TextEditingController numbersOnUpperShell = TextEditingController();
  TextEditingController numbersOnLowerShell = TextEditingController();
  RxString mainBearingsTorqued = 'YES'.obs;
  TextEditingController mainBearingsTorquedSpecs = TextEditingController();
  RxString thrustBearingsTorqued = 'YES'.obs;
  RxString crossTiesTorqued = 'YES'.obs;
  TextEditingController crossTiesTorquedSpecs = TextEditingController();
  RxString counterWeightsTorqued = 'YES'.obs;
  TextEditingController counterWeightsTorquedSpecs = TextEditingController();
  RxString vibrationDampenerTorqued = 'YES'.obs;
  TextEditingController vibrationDampenerTorquedSpecs1 =
      TextEditingController();
  TextEditingController vibrationDampenerTorquedSpecs2 =
      TextEditingController();
  RxString frontAndRearSealsReplaced = 'YES'.obs;
  TextEditingController frontSeals = TextEditingController();
  TextEditingController rearSeals = TextEditingController();

  ///----------------------Connecting Rods------------------------
  RxString connectingRods = 'NEW'.obs;
  List<TextEditingController> connectingRodsIndicateWhichOneCtrl = [];
  RxString connectingRodsBearingsReplaced = 'YES'.obs;
  TextEditingController connectingRodsBearingsIfNotIndicateWhy =
      TextEditingController();
  RxString rodBearingCapsTorqued = 'YES'.obs;
  TextEditingController rodBearingCapsTorquedSpecs = TextEditingController();
  RxString connectingRodSideClearanceChecked = 'YES'.obs;
  TextEditingController connectingRodSideClearanceCheckedSpecs =
      TextEditingController();
  List<TextEditingController> actualReadingsCtrl = [];

  ///----------------------Piston Pins------------------------
  RxString pistonPins = 'NEW'.obs;
  List<TextEditingController> pistonPinsIndicateNewPinsCtrl = [];
  RxString pistons = 'NEW'.obs;
  List<TextEditingController> indicateNewPistonsCtrl = [];

  ///----------------------Ring Clearance in Liners------------------------
  List<List<TextEditingController>> ringClearanceInLinersCtrl = [];

  ///----------------------Ring Clearance in Pistons------------------------
  List<TextEditingController> ringClearanceInPistonsCtrl = [];

  ///----------------------Cylinder Liners------------------------
  RxString cylinderLiners = 'NEW'.obs;
  List<TextEditingController> indicateNewCylinderLinersCtrl = [];
  RxString linerORingsReplaced = 'NEW'.obs;

  ///----------------------Cylinder Heads------------------------
  RxString cylinderHeads1 = 'NEW'.obs;
  List<TextEditingController> indicateCylinderHeadsCtrl = [];
  RxString cylinderHeads2 = 'YES'.obs;
  TextEditingController cylinderHeadsSpecs = TextEditingController();

  ///----------------------Rocket Shaft Assemblies------------------------
  RxString rocketShaftAssemblies = 'NEW'.obs;
  List<TextEditingController> indicateRocketShaftAssembliesCtrl = [];
  RxString rocketShaftTorqued = 'NEW'.obs;
  TextEditingController rocketShaftTorquedSpecs = TextEditingController();

  ///----------------------Push Rods------------------------
  RxString pushRods = 'NEW'.obs;

  ///----------------------Camshaft------------------------
  RxString camshaft = 'NEW'.obs;
  RxString camshaftBearingsReplaced = 'YES'.obs;
  RxString camshaftBearingsTorqued = 'YES'.obs;
  TextEditingController camshaftBearingsTorquedSpecs = TextEditingController();
  RxString camshaftEndPlayChecked = 'YES'.obs;
  TextEditingController camshaftEndPlayCheckedSpecs = TextEditingController();
  TextEditingController camshaftEndPlayCheckedActual = TextEditingController();

  ///----------------------Cam Followers------------------------
  RxString camFollowers = 'NEW'.obs;

  ///----------------------Bridges------------------------
  RxString bridges = 'NEW'.obs;

  ///----------------------Valves------------------------
  TextEditingController valvesIntake = TextEditingController();
  TextEditingController valvesExhaust = TextEditingController();
  TextEditingController valvesInjector = TextEditingController();

  ///----------------------Injector Trim Codes------------------------
  List<TextEditingController> injectorTrimCodesCtrl = [];

  ///----------------------All Components------------------------
  RxString oilPump = 'NEW'.obs;
  RxString oilWaterPump = 'NEW'.obs;
  RxString auxWaterPump = 'NEW'.obs;
  RxString starter = 'NEW'.obs;
  RxString waterGate = 'NEW'.obs;
  RxString trubo = 'NEW'.obs;
  RxString oilFilters = 'NEW'.obs;
  RxString airFilters = 'NEW'.obs;
  RxString airBelts = 'NEW'.obs;
  RxString accessoryDrive = 'NEW'.obs;
  RxString interCooler = 'NEW'.obs;
  RxString fuelInjectors = 'NEW'.obs;
  RxString bridges2 = 'NEW'.obs;
  RxString scavengePump = 'NEW'.obs;
  RxString fuelFilters = 'NEW'.obs;
  RxString fuelPump = 'NEW'.obs;

  ///----------------------Mechanic Checkings------------------------
  TextEditingController mechanic1MainBearingCap = TextEditingController();
  TextEditingController mechanic2MainBearingCap = TextEditingController();
  TextEditingController mechanic1ConnectingRodTorqued = TextEditingController();
  TextEditingController mechanic2ConnectingRodTorqued = TextEditingController();
  TextEditingController mechanic1ConnectingRodSide = TextEditingController();
  TextEditingController mechanic2ConnectingRodSide = TextEditingController();
  TextEditingController mechanic1AllInternalPlugs = TextEditingController();
  TextEditingController mechanic2AllInternalPlugs = TextEditingController();
  TextEditingController mechanic1CrankShaftEndPlay = TextEditingController();
  TextEditingController mechanic2CrankShaftEndPlay = TextEditingController();
}
