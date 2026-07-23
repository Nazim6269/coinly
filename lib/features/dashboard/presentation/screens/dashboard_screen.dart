import 'package:flutter/material.dart';
import '../../../expenses/presentation/screens/expense_history_screen.dart';
import '../widgets/total_spend_card.dart';
import '../widgets/recent_expenses_list.dart';
import '../widgets/quick_add_fab.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coinly'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ExpenseHistoryScreen()),
              );
            },
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            TotalSpendCard(),
            SizedBox(height: 24),
            Align(alignment: Alignment.centerLeft, child: Text('Recent')),
            SizedBox(height: 8),
            Expanded(child: RecentExpensesList()),
          ],
        ),
      ),
      floatingActionButton: const QuickAddFab(),
    );
  }
}
