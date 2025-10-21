import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_path.dart';
import 'package:go_router/go_router.dart';

class TopRow extends StatelessWidget {
  const TopRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 100,
                height: 100,
                color: Colors.amber,
                child: Center(child: Text('Reports')),
              ),
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 100,
                height: 100,
                color: Colors.amber,
                child: Center(child: Text('Appliances')),
              ),
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: () {
                context.go(PagePath.settings);
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.amber,
                child: Center(child: Text('Settings')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
