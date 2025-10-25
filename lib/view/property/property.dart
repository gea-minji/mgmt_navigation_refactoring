import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_path.dart';
import 'package:flutter_application_1/model/location.dart';
import 'package:go_router/go_router.dart';

class Property extends StatelessWidget {
  const Property({super.key});
  @override
  Widget build(BuildContext context) {
    final properties = [
      'IA Q',
      'Appliance Park',
      'QA Property',
      '3AP4 Ywork',
      '5 EB Property',
      'SH Office',
    ];
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(15),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: properties.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext cpmtext, int index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black),
              color: Theme.of(context).colorScheme.surfaceContainer,
            ),
            child: InkWell(
              onTap: () {
                final model = Location(
                  name: properties[index],
                  unitId: 'sdfdssdf',
                  locationCount: '2',
                  hasFaultCount: false,
                ).toJson();
                final encoded = Uri.encodeComponent(jsonEncode(model));
                final target =
                    '${PagePath.buildingSelection}?location=$encoded';
                context.go(target);
              },
              child: Text(
                properties[index],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
