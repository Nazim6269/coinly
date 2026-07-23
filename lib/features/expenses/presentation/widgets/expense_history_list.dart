import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/dashed_divider.dart';
import '../../domain/entities/expense.dart';
import '../providers/expense_providers.dart';
import 'expense_tile.dart';

class ExpenseHistoryList extends ConsumerWidget {
  const ExpenseHistoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredAsync = ref.watch(filteredHistoryProvider);

    return filteredAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Error: $err')),
      data: (expenses) {
        if (expenses.isEmpty) {
          return const Center(child: Text('No expenses match this filter'));
        }

        final grouped = <String, List<Expense>>{};
        for (final e in expenses) {
          final key = DateFormat('EEEE, MMM d').format(e.date);
          grouped.putIfAbsent(key, () => []).add(e);
        }

        return ListView(
          children: grouped.entries.expand((entry) {
            return [
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 4),
                child: Text(
                  entry.key,
                  style: TextStyle(
                    color: AppColors.textOnDark.withOpacity(0.5),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ...entry.value.map((e) => ExpenseTile(expense: e)),
              const DashedDivider(),
            ];
          }).toList(),
        );
      },
    );
  }
}
