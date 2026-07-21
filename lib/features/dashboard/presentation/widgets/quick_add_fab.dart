import 'package:flutter/material.dart';

class QuickAddFab extends StatelessWidget {
  const QuickAddFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // TODO: navigate to Add Expense screen — next step in Phase 1
        debugPrint('Quick add tapped');
      },
      child: const Icon(Icons.add),
    );
  }
}
