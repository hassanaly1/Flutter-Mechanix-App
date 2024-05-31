import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/report_v8_controller.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/models/overhaul_report_model.dart';
import 'package:mechanix/views/add_task/engine_overhawl_report/custom_v8_body.dart';

class UpdateOverhaulTaskScreen extends StatefulWidget {
  final OverHaulReportModel model;
  final int index;

  const UpdateOverhaulTaskScreen(
      {super.key, required this.model, required this.index});

  @override
  State<UpdateOverhaulTaskScreen> createState() =>
      _UpdateOverhaulTaskScreenState();
}

class _UpdateOverhaulTaskScreenState extends State<UpdateOverhaulTaskScreen> {
  late OverhaulReportController controller;

  @override
  void initState() {
    controller = Get.put(OverhaulReportController(widget.index));
    super.initState();
  }

  @override
  void dispose() {
    debugPrint('UpdateTaskDisposeCalled');
    Get.delete<OverhaulReportController>();
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
                controller: controller.scrollController,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                        floating: true,
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.transparent,
                        forceMaterialTransparency: true,
                        expandedHeight: context.height * 0.15,
                        flexibleSpace: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () => Get.back(),
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      )),
                                  Flexible(
                                    child: CustomTextWidget(
                                      text: widget.model.type,
                                      maxLines: 2,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.0,
                                      textColor: Colors.white,
                                    ),
                                  ),
                                  // PdfService().printCustomersPdf(
                                  //   widget.model,
                                  // );
                                  IconButton(
                                      // onPressed: () => createPdf(widget.model),
                                      onPressed: () async {},
                                      icon: const Icon(
                                        Icons.picture_as_pdf_sharp,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                            )))
                  ];
                },
                body: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    child: const Column(
                      children: [
                        Expanded(child: CustomV8Body1(isTaskUpdating: true)),
                      ],
                    )),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => controller.scrollUp(),
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

// Future<void> createPdf(OverHaulReportModel model) async {
//   try {
//     // Create a new PDF document
//     PdfDocument document = PdfDocument();
//
//     // Add a new page and draw text
//     final page = document.pages.add();
//
//     page.graphics.drawImage(
//         PdfBitmap(await _readFileBytes('assets/images/app-logo.png')),
//         const Rect.fromLTWH(0, 0, 100, 100));
//     page.graphics.drawString(
//       '${model.type}  Report',
//       format: PdfStringFormat(alignment: PdfTextAlignment.center),
//       PdfStandardFont(PdfFontFamily.helvetica, 30),
//       brush: PdfSolidBrush(PdfColor(0, 0, 0)),
//       bounds: const Rect.fromLTWH(0, 50, 500, 150),
//     );
//
//     // Create and draw the first table
//     PdfGrid grid1 = PdfGrid();
//     grid1.columns.add(count: 2);
//     grid1.headers.add(1);
//     PdfGridRow header1 = grid1.headers[0];
//     header1.cells[0].value = '1st Table';
//     header1.cells[1].value = 'Value';
//     void addRow(PdfGrid grid, String label, String value) {
//       PdfGridRow row = grid.rows.add();
//       row.cells[0].value = label;
//       row.cells[1].value = value;
//     }
//
//     // Add rows for the first table
//     addRow(grid1, 'Type', model.type);
//     addRow(grid1, 'Customer', model.customerEngineInfo.customer.text);
//     addRow(grid1, 'Work Order', model.customerEngineInfo.workorder.text);
//     addRow(grid1, 'Location', model.customerEngineInfo.location.text);
//     addRow(grid1, 'LSD', model.customerEngineInfo.lsd.text);
//     addRow(grid1, 'Unit', model.customerEngineInfo.unit.text);
//     addRow(grid1, 'Unit Hours', model.customerEngineInfo.unitHours.text);
//     addRow(grid1, 'Engine Make', model.customerEngineInfo.engineMake.text);
//     addRow(grid1, 'Engine Model', model.customerEngineInfo.engineModel.text);
//     addRow(
//         grid1, 'Engine Serial', model.customerEngineInfo.engineSerial.text);
//     addRow(grid1, 'Engine Arrangement',
//         model.customerEngineInfo.engineArrangement.text);
//     addRow(grid1, 'Customer Contact',
//         model.customerEngineInfo.customerContact.text);
//     addRow(grid1, 'Mechanic 1', model.customerEngineInfo.mechanic1.text);
//     addRow(grid1, 'Mechanic 2', model.customerEngineInfo.mechanic2.text);
//
//     grid1.draw(page: page, bounds: const Rect.fromLTRB(0, 220, 0, 0));
//     page.graphics.drawString(
//         'Customer Engine Info',
//         format: PdfStringFormat(alignment: PdfTextAlignment.center),
//         PdfStandardFont(PdfFontFamily.helvetica, 16),
//         brush: PdfSolidBrush(PdfColor(0, 0, 0)),
//         bounds: const Rect.fromLTRB(250, 190, 0, 0));
//
//     // Create and draw the second table
//     PdfGrid grid2 = PdfGrid();
//     grid2.columns.add(count: 2);
//     grid2.headers.add(1);
//     PdfGridRow header2 = grid2.headers[0];
//     header2.cells[0].value = 'Details';
//     header2.cells[1].value = 'Value';
//
//     // Add rows for the second table
//     addRow(grid2, 'Engine Blocks', model.type);
//     addRow(
//         grid2, 'Line Bore Performed', model.customerEngineInfo.customer.text);
//     addRow(grid2, 'Mag Checked For Cracks',
//         model.customerEngineInfo.workorder.text);
//     addRow(
//         grid2, 'Liner Fits Repaired', model.customerEngineInfo.location.text);
//     addRow(grid2, 'Engine Crankshaft', model.customerEngineInfo.lsd.text);
//     addRow(grid2, 'lineBore Performed Company',
//         model.customerEngineInfo.unit.text);
//     addRow(grid2, 'Mag Checked Company',
//         model.customerEngineInfo.unitHours.text);
//     addRow(grid2, 'liner Fits Repaired Company',
//         model.customerEngineInfo.engineMake.text);
//     addRow(grid2, 'Plasti Guage Readings One Main Bearing Spec',
//         model.customerEngineInfo.engineModel.text);
//     addRow(grid2, 'Plasti Guage Readings One Main Bearing Actual',
//         model.customerEngineInfo.engineSerial.text);
//     addRow(grid2, 'End Play Spec',
//         model.customerEngineInfo.engineArrangement.text);
//     addRow(grid2, 'End Play Actual',
//         model.customerEngineInfo.customerContact.text);
//     addRow(grid2, 'Mechanic 1', model.customerEngineInfo.mechanic1.text);
//     addRow(grid2, 'Mechanic 2', model.customerEngineInfo.mechanic2.text);
//     grid2.draw(page: page, bounds: const Rect.fromLTWH(0, 480, 0, 0));
//     page.graphics.drawString(
//         'Engine Assembly Info',
//         format: PdfStringFormat(alignment: PdfTextAlignment.center),
//         PdfStandardFont(PdfFontFamily.helvetica, 16),
//         brush: PdfSolidBrush(PdfColor(0, 0, 0)),
//         bounds: const Rect.fromLTRB(250, 450, 0, 0));
//
//     // Save the document
//     List<int> bytes = await document.save();
//
//     if (kIsWeb) {
//       // Web-specific code to download the PDF
//       String base64String = base64.encode(bytes);
//       // js.context['pdfData'] = base64String;
//       // js.context['filename'] = 'Output.pdf';
//       // js.context.callMethod('download');
//     } else {
//       // Mobile-specific code to save and open the PDF
//       final directory = await getApplicationSupportDirectory();
//       final path = directory.path;
//       File file = File('$path/Output.pdf');
//       await file.writeAsBytes(bytes, flush: true);
//       final result = await OpenFile.open('$path/Output.pdf');
//       print(result.message); // Print the result message for debugging
//     }
//
//     // Dispose the document
//     document.dispose();
//   } catch (e) {
//     print('Error: $e');
//   }
// }
//
// Future<Uint8List> _readFileBytes(String filePath) async {
//   final ByteData data = await rootBundle.load(filePath);
//   return data.buffer.asUint8List();
// }
}
