import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_path.dart';
import 'package:go_router/go_router.dart';

class LeftColumn extends StatelessWidget {
  const LeftColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: InkWell(
              onTap: () => context.go(PagePath.propertySelection),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blueGrey,
                child: Center(child: Text('Property')),
              ),
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: () => context.go(PagePath.notification),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blueGrey,
                child: Center(child: Text('Notification')),
              ),
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: () => context.go(PagePath.diagnostics),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blueGrey,
                child: Center(child: Text('Diagnostics')),
              ),
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: () => context.go('${PagePath.main}${PagePath.task}'),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blueGrey,
                child: Center(child: Text('Task')),
              ),
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: () => context.go(PagePath.reports),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blueGrey,
                child: Center(child: Text('Reports')),
              ),
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: () => context.go(PagePath.usersAndRoles),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blueGrey,
                child: Center(child: Text('Users & Roles')),
              ),
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: () => context.go(PagePath.settings),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blueGrey,
                child: Center(child: Text('Settings')),
              ),
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: () => context.go(PagePath.trainingLibrary),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blueGrey,
                child: Center(child: Text('Training Library')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
