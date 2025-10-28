import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_path.dart';
import 'package:flutter_application_1/left_column.dart';
import 'package:flutter_application_1/model/location.dart';
import 'package:flutter_application_1/model/task.dart';
import 'package:flutter_application_1/view/control/appliance_detail.dart';
import 'package:flutter_application_1/view/diagnostics/diagnostics_list.dart';
import 'package:flutter_application_1/view/property/building_controller.dart';
import 'package:flutter_application_1/view/property/building_selection.dart';
import 'package:flutter_application_1/view/property/property.dart';
import 'package:flutter_application_1/view/reports/financial_left_menu.dart';
import 'package:flutter_application_1/view/reports/input.dart';
import 'package:flutter_application_1/view/reports/reports_selection.dart';
import 'package:flutter_application_1/view/reports/result.dart';
import 'package:flutter_application_1/view/task/task_detail.dart';
import 'package:flutter_application_1/view/task/task_list.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

void main() {
  // Get.lazyPut(() => BuildingController());
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
            path: '/main',
            builder: (context, state) => Property(),
            routes: [
              GoRoute(
                path: '/task',
                builder: (context, state) => const TaskList(),
                routes: [
                  GoRoute(
                    path: '/detail',
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
              GoRoute(
                path: '/property',
                builder: (context, state) => Property(),
                routes: [
                  GoRoute(
                    path: '/building',
                    builder: (context, state) {
                      Get.lazyPut(() => BuildingController());
                      final encoded = state.uri.queryParameters['location'];
                      Location? location;
                      // We don't send the same data model for the location page
                      // from location selection or Diagnostics
                      if (encoded != null && encoded.isNotEmpty) {
                        final decoded = jsonDecode(
                          Uri.decodeComponent(encoded),
                        );
                        location = Location.fromJson(decoded);
                      }
                      return BuildingSelection(model: location);
                    },
                    routes: [
                      GoRoute(
                        path: '/appliance',
                        builder: (context, state) {
                          return ApplianceDetail();
                        },
                      ),
                    ],
                  ),
                ],
              ),
              GoRoute(
                path: '/reports',
                builder: (context, state) => ReportsSelection(),
                routes: [
                  ShellRoute(
                    builder: (context, state, child) =>
                        FinancialLeftMenu(content: child),
                    routes: [
                      GoRoute(
                        path: '/financial',
                        builder: (context, state) => FinancialInput(),
                        routes: [
                          GoRoute(
                            path: '/result',
                            builder: (context, state) => FinancialResult(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              GoRoute(
                path: '/diagnostics',
                builder: (context, state) => DiagnosticsList(),
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xfff2a900),
          onPrimary: Colors.white,
          secondary: Color(0xff979797),
          onSecondary: Colors.white,
          tertiary: Color(0xffFF453A),
          onTertiary: Colors.white,
          error: Colors.black,
          onError: Colors.white,
          surface: Color(0xff272625),
          onSurface: Colors.white,
          surfaceContainerLowest: Color(0xff333333),
          surfaceContainer: Color(0xff1E1F20),
        ),
      ),
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
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'POC',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(child: Container()),
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
