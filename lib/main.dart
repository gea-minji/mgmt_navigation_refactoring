import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_path.dart';
import 'package:flutter_application_1/left_column.dart';
import 'package:flutter_application_1/model/task.dart';
import 'package:flutter_application_1/top_row.dart';
import 'package:flutter_application_1/view/settings.dart';
import 'package:flutter_application_1/view/task_detail.dart';
import 'package:flutter_application_1/view/task_list.dart';
import 'package:go_router/go_router.dart';

void main() {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorKey = GlobalKey<NavigatorState>();

  final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: PagePath.main,
    routes: [
      GoRoute(
        path: PagePath.main,
        builder: (context, state) => Main(
          content: Center(
            child: Text(
              'Main Page',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        pageBuilder: (context, state, child) => CustomTransitionPage<void>(
          child: Main(content: child),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeIn).animate(animation),
              child: child,
            );
          },
        ),
        routes: [
          // GoRoute(
          //   path: PagePath.taskList,
          //   builder: (context, state) {
          //     return Navigator(
          //       onGenerateRoute: (settings) {
          //         final uri = Uri.parse(settings.name ?? '');
          //         final path = uri.path;
          //         Widget page;
          //         switch (path) {
          //           case PagePath.taskDetail:
          //             final encoded = state.uri.queryParameters['task'];
          //             final decoded = jsonDecode(
          //               Uri.decodeComponent(encoded ?? ''),
          //             );
          //             page = TaskDetail(model: Task.fromJson(decoded));
          //             break;
          //           default:
          //             page = TaskList();
          //         }
          //         return MaterialPageRoute(
          //           builder: (_) => page,
          //           settings: settings,
          //         );
          //       },
          //     );
          //   },
          // ),
          GoRoute(
            path: PagePath.taskList,
            builder: (context, state) => TaskList(),
          ),
          GoRoute(
            path: PagePath.taskDetail,
            builder: (context, state) {
              final encoded = state.uri.queryParameters['task'];
              final decoded = jsonDecode(Uri.decodeComponent(encoded ?? ''));
              return TaskDetail(model: Task.fromJson(decoded));
            },
          ),
          GoRoute(
            path: PagePath.settings,
            builder: (context, state) => Settings(),
          ),
          GoRoute(
            path: PagePath.notification,
            builder: (context, state) => Container(),
          ),
        ],
      ),
    ],
  );
  runApp(MaterialApp.router(routerConfig: router));
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
