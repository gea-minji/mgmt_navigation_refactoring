import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_path.dart';
import 'package:go_router/go_router.dart';

class LeftColumn extends StatelessWidget {
  const LeftColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final buttons = {
      PagePath.propertySelection: 'Property',
      PagePath.notification: 'Notification',
      PagePath.diagnostics: 'Diagnostics',
      PagePath.task: 'Task',
      PagePath.reports: 'Reports',
      PagePath.usersAndRoles: 'Users & Roles',
      PagePath.settings: 'Settings',
      PagePath.trainingLibrary: 'Training Library',
    };
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons.keys.map((key) {
        return Flexible(
          child: InkWell(
            onTap: () => context.go(key),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Center(child: Text(buttons[key] ?? '')),
            ),
          ),
        );
      }).toList(),
    );
  }
}
