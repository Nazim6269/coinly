import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/add_expense_form_provider.dart';

class DatePickerField extends ConsumerWidget {
  const DatePickerField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(addExpenseFormProvider);

    return InkWell(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: form.date,
          firstDate: DateTime(2020),
          lastDate: DateTime.now(),
        );
        if (picked != null) {
          ref.read(addExpenseFormProvider.notifier).setDate(picked);
        }
      },
      child: Row(
        children: [
          const Icon(
            Icons.calendar_today,
            size: 18,
            color: AppColors.textOnDark,
          ),
          const SizedBox(width: 8),
          Text(DateFormat('MMM d, yyyy').format(form.date)),
        ],
      ),
    );
  }
}
