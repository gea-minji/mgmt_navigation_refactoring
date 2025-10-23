import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_path.dart';
import 'package:flutter_application_1/left_column.dart';
import 'package:flutter_application_1/model/task.dart';
import 'package:flutter_application_1/top_row.dart';
import 'package:flutter_application_1/view/task_detail.dart';
import 'package:flutter_application_1/view/task_list.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: PagePath.main, // root page
    debugLogDiagnostics: true,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => Main(content: child),
        routes: [
          GoRoute(
            path: PagePath.main,
            builder: (context, state) => Center(
              child: Text(
                'Main Page',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            routes: [
              GoRoute(
                path: PagePath.task,
                builder: (context, state) => const TaskList(),
                routes: [
                  GoRoute(
                    path: PagePath.taskDetail,
                    builder: (context, state) {
                      final encoded = state.uri.queryParameters['task'];
                      final decoded = jsonDecode(
                        Uri.decodeComponent(encoded ?? ''),
                      );
                      return TaskDetail(model: Task.fromJson(decoded));
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Navigation Refactoring',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: _router,
    );
  }
}

class Main extends StatelessWidget {
  const Main({super.key, required this.content});
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    context.go(PagePath.main);
                  },
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Text(
                      'POC',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(child: TopRow()),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LeftColumn(),
                Expanded(
                  child: content, // to be changed another widget
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
