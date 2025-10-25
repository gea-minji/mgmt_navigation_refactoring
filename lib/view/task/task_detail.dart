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
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(15),
            ),
            width: double.infinity,
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
                  margin: const EdgeInsets.only(right: 20, bottom: 20, top: 10),
                  width: 100,
                  height: 50,
                  color: Theme.of(context).colorScheme.primary,
                  child: Center(
                    child: Text(
                      'Back',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
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
