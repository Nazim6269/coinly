import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/add_expense_form_provider.dart';

class NoteField extends ConsumerWidget {
  const NoteField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      style: const TextStyle(color: AppColors.textOnDark),
      decoration: InputDecoration(
        hintText: 'Add a note (optional)',
        hintStyle: TextStyle(color: AppColors.textOnDark.withValues(alpha: 0.4)),
        filled: true,
        fillColor: AppColors.surface.withValues(alpha: 0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: (value) =>
          ref.read(addExpenseFormProvider.notifier).setNote(value),
    );
  }
}
