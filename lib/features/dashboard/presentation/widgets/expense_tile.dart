import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/expense.dart';
import '../../domain/entities/expense_category.dart';

IconData _iconForCategory(ExpenseCategory category) {
  switch (category) {
    case ExpenseCategory.food:
      return Icons.restaurant;
    case ExpenseCategory.transport:
      return Icons.directions_car;
    case ExpenseCategory.accommodation:
      return Icons.bed;
    case ExpenseCategory.shopping:
      return Icons.shopping_bag;
    case ExpenseCategory.entertainment:
      return Icons.celebration;
    case ExpenseCategory.other:
      return Icons.more_horiz;
  }
}

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
            backgroundColor: AppColors.primaryAccent.withOpacity(0.15),
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
                    color: AppColors.textOnDark.withOpacity(0.5),
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
