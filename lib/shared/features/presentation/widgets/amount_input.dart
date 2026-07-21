import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/add_expense_form_provider.dart';

class AmountInput extends ConsumerWidget {
  const AmountInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(addExpenseFormProvider);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(form.currencyCode, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(width: 12),
        Expanded(
          child: TextField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontSize: 32),
            decoration: InputDecoration(
              hintText: '0.00',
              hintStyle: TextStyle(
                color: AppColors.textOnDark.withOpacity(0.3),
              ),
              border: InputBorder.none,
            ),
            onChanged: (value) =>
                ref.read(addExpenseFormProvider.notifier).setAmount(value),
          ),
        ),
      ],
    );
  }
}
