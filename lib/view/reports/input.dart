import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_path.dart';
import 'package:go_router/go_router.dart';

class FinancialInput extends StatelessWidget {
  const FinancialInput({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text('Reports Input'),
          ),
        ),
        InkWell(
          onTap: () {
            context.go(PagePath.financialReportsResult);
          },
          child: Container(
            margin: const EdgeInsets.only(right: 20, bottom: 20, top: 10),
            width: 100,
            height: 50,
            color: Theme.of(context).colorScheme.primary,
            child: Center(
              child: Text(
                'Submit',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
