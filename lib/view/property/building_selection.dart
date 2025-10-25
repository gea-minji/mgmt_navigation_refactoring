import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_path.dart';
import 'package:flutter_application_1/model/location.dart';
import 'package:flutter_application_1/view/property/building_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:go_router/go_router.dart';

class BuildingSelection extends GetView<BuildingController> {
  const BuildingSelection({super.key, required this.model});

  final Location model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () => context.pop(),
                child: Icon(Icons.arrow_back, color: Color(0xff808080)),
              ),
              const SizedBox(width: 10),
              Text(
                model.name ?? '',
                style: TextStyle(color: Color(0xff808080)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: InkWell(
                        onTap: () => controller.onBuildingCardClicked(),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xff525252),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Building A',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  DottedLineVertical(),
                  Expanded(
                    child: Obx(
                      () => Visibility(
                        visible: controller.isFloorDisplayed.value,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: InkWell(
                            onTap: () => controller.onFloorCardClicked(),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xff525252),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Floor 1',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  DottedLineVertical(),
                  Expanded(
                    child: Obx(
                      () => Visibility(
                        visible: controller.isGroupDisplayed.value,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: InkWell(
                            onTap: () {
                              final encoded = Uri.encodeComponent(
                                jsonEncode(model),
                              );
                              final target =
                                  '${PagePath.applianceControl}?location=$encoded';
                              context.go(target);
                            },
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).colorScheme.surfaceContainer,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'A201',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DottedLineVertical extends StatelessWidget {
  final Color color;
  final double dashWidth;
  final double dashSpace;

  const DottedLineVertical({
    super.key,
    this.color = Colors.black,
    this.dashWidth = 4,
    this.dashSpace = 4,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          painter: _DottedLineVerticalPainter(
            color: color,
            dashWidth: dashWidth,
            dashSpace: dashSpace,
          ),
          size: Size(1, constraints.maxHeight),
        );
      },
    );
  }
}

class _DottedLineVerticalPainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;

  _DottedLineVerticalPainter({
    required this.color,
    required this.dashWidth,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double startY = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
