import 'package:coinly/shared/features/presentation/screens/add_expense_screen.dart';
import 'package:flutter/material.dart';

class QuickAddFab extends StatelessWidget {
  const QuickAddFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => const AddExpenseScreen()));
      },
      child: const Icon(Icons.add),
    );
  }
}
