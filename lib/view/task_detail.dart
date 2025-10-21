import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/task.dart';
import 'package:go_router/go_router.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key, required this.model});

  final Task model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.orangeAccent,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(model.title, style: TextStyle(fontSize: 20)),
                Text(model.description, style: TextStyle(fontSize: 20)),
                Text(model.createdDate, style: TextStyle(fontSize: 20)),
                Text(model.assignee, style: TextStyle(fontSize: 20)),
                Text(model.createdBy, style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: InkWell(
                onTap: () {
                  context.pop(context);
                },
                child: Container(
                  width: 100,
                  height: 50,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      'Back',
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
