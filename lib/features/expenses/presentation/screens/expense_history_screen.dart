import 'package:flutter/material.dart';
import '../widgets/category_filter_bar.dart';
import '../widgets/date_range_filter_bar.dart';
import '../widgets/expense_history_list.dart';

class ExpenseHistoryScreen extends StatelessWidget {
  const ExpenseHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 8),
            const CategoryFilterBar(),
            const SizedBox(height: 12),
            const DateRangeFilterBar(),
            const SizedBox(height: 8),
            const Expanded(child: ExpenseHistoryList()),
          ],
        ),
      ),
    );
  }
}

