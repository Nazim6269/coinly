import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/expense_category.dart';
import '../providers/add_expense_form_provider.dart';

class CategoryPicker extends ConsumerWidget {
  const CategoryPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(addExpenseFormProvider);

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: ExpenseCategory.values.map((category) {
        final isSelected = form.category == category;
        return ChoiceChip(
          label: Text(category.label),
          selected: isSelected,
          selectedColor: AppColors.primaryAccent,
          backgroundColor: AppColors.surface.withOpacity(0.1),
          labelStyle: TextStyle(
            color: isSelected ? AppColors.inkNavy : AppColors.textOnDark,
            fontWeight: FontWeight.w600,
          ),
          onSelected: (_) =>
              ref.read(addExpenseFormProvider.notifier).setCategory(category),
        );
      }).toList(),
    );
  }
}
