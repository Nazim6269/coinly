import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/dashed_divider.dart';
import '../../../../shared/features/presentation/providers/expense_providers.dart';
import '../../../../shared/features/presentation/widgets/expense_tile.dart';

class RecentExpensesList extends ConsumerWidget {
  const RecentExpensesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expensesAsync = ref.watch(recentExpensesProvider);

    return expensesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Error: $err')),
      data: (expenses) {
        if (expenses.isEmpty) {
          return const Center(
            child: Text('No expenses yet — tap + to add one'),
          );
        }
        return ListView.separated(
          itemCount: expenses.length,
          separatorBuilder: (_, __) => const DashedDivider(),
          itemBuilder: (context, index) =>
              ExpenseTile(expense: expenses[index]),
        );
      },
    );
  }
}
