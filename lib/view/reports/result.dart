import 'package:flutter/material.dart';

class FinancialResult extends StatelessWidget {
  const FinancialResult({super.key});
  @override
  Widget build(BuildContext context) {
    final items = List.generate(5, (index) => 'Report $index');
    return Container(
      margin: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
      color: Theme.of(context).colorScheme.surfaceContainerLowest,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            child: ListTile(
              leading: const Icon(Icons.task),
              title: Text(items[index]),
              onTap: () {},
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.all(5),
            ),
          );
        },
      ),
    );
  }
}
