import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_path.dart';
import 'package:go_router/go_router.dart';

import '../../model/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(5, (index) => 'Task $index');
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(15),
            ),
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
                    title: Text(items[index]),
                    onTap: () {
                      final model = Task(
                        title: 'Schedule $index',
                        description: 'Description',
                        createdDate: '2025-10-20',
                        createdBy: 'ID $index',
                        assignee: 'Assignee',
                      ).toJson();
                      final encoded = Uri.encodeComponent(jsonEncode(model));
                      final target = '${PagePath.taskDetail}?task=$encoded';
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
