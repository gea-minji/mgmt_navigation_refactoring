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
              onTap: () {
                context.go(PagePath.taskList);
              },
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
              onTap: () {},
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
              onTap: () {},
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blueGrey,
                child: Center(child: Text('Profile')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
