import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/date_range_filter.dart';
import '../providers/expense_providers.dart';

class DateRangeFilterBar extends ConsumerWidget {
  const DateRangeFilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(historyFilterProvider);

    return Row(
      children: DateRangeFilter.values.map((range) {
        final selected = filter.dateRangeFilter == range;
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
            onTap: () =>
                ref.read(historyFilterProvider.notifier).setDateRange(range),
            child: Text(
              range.label,
              style: TextStyle(
                color: selected
                    ? AppColors.primaryAccent
                    : AppColors.textOnDark.withOpacity(0.5),
                fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
