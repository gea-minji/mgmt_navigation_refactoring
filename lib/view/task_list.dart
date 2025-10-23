import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_path.dart';
import 'package:go_router/go_router.dart';

import '../model/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(5, (index) => 'Task $index');
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 10,
                ),
                child: ListTile(
                  leading: const Icon(Icons.task),
                  title: Text(
                    items[index],
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    final model = Task(
                      title: 'Schedule $index',
                      description: 'Description',
                      createdDate: '2025-10-20',
                      createdBy: 'ID $index',
                      assignee: 'Assignee',
                    ).toJson();
                    final encoded = Uri.encodeComponent(jsonEncode(model));
                    final target =
                        '${PagePath.main}${PagePath.task}${PagePath.taskDetail}?task=$encoded';
                    context.go(target);
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.all(5),
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: InkWell(
                onTap: () {
                  context.pop();
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
