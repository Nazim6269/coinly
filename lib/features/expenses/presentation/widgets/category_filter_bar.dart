import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/expense_category.dart';
import '../providers/expense_providers.dart';

class CategoryFilterBar extends ConsumerWidget {
  const CategoryFilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(historyFilterProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _chip(
            context,
            ref,
            label: 'All',
            selected: filter.category == null,
            onTap: () {
              ref.read(historyFilterProvider.notifier).setCategory(null);
            },
          ),
          ...ExpenseCategory.values.map(
            (category) => _chip(
              context,
              ref,
              label: category.label,
              selected: filter.category == category,
              onTap: () => ref
                  .read(historyFilterProvider.notifier)
                  .setCategory(category),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(
    BuildContext context,
    WidgetRef ref, {
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        selectedColor: AppColors.primaryAccent,
        backgroundColor: AppColors.surface.withOpacity(0.1),
        labelStyle: TextStyle(
          color: selected ? AppColors.inkNavy : AppColors.textOnDark,
          fontWeight: FontWeight.w600,
        ),
        onSelected: (_) => onTap(),
      ),
    );
  }
}
