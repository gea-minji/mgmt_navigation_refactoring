import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/argument_keys.dart';
import 'package:flutter_application_1/constants/page_path.dart';
import 'package:go_router/go_router.dart';

class DiagnosticsList extends StatelessWidget {
  const DiagnosticsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          final target =
              '${PagePath.applianceControl}?&${ArgumentKeys.locationId}=""&${ArgumentKeys.unitId}="sdfdsds"&${ArgumentKeys.floorId}="dsfsdfd"&${ArgumentKeys.roomId}=""&${ArgumentKeys.updId}=""';
          context.go(target);
        },
        child: Text('Go to appliance detail'),
      ),
    );
  }
}
