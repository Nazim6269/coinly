import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/expense.dart';
import '../../domain/entities/expense_category.dart';

IconData _iconForCategory(ExpenseCategory category) => switch (category) {
  ExpenseCategory.food => Icons.restaurant,
  ExpenseCategory.transport => Icons.directions_car,
  ExpenseCategory.accommodation => Icons.bed,
  ExpenseCategory.shopping => Icons.shopping_bag,
  ExpenseCategory.entertainment => Icons.celebration,
  ExpenseCategory.other => Icons.more_horiz,
};

class ExpenseTile extends StatelessWidget {
  final Expense expense;
  const ExpenseTile({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM d, h:mm a');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primaryAccent.withValues(alpha: 0.15),
            child: Icon(
              _iconForCategory(expense.category),
              color: AppColors.primaryAccent,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.note ?? expense.category.label,
                  style: const TextStyle(
                    color: AppColors.textOnDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  dateFormat.format(expense.date),
                  style: TextStyle(
                    color: AppColors.textOnDark.withValues(alpha: 0.5),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${expense.amount.toStringAsFixed(0)} ${expense.currencyCode}',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
