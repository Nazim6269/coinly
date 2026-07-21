import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../features/onboarding/presentation/providers/onboarding_providers.dart';
import '../providers/add_expense_form_provider.dart';

class CurrencyPickerField extends ConsumerWidget {
  const CurrencyPickerField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(addExpenseFormProvider);
    final currenciesAsync = ref.watch(currencyListProvider);

    return currenciesAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (currencies) => DropdownButton<String>(
        value: form.currencyCode,
        dropdownColor: AppColors.surface,
        underline: const SizedBox.shrink(),
        items: currencies
            .map(
              (c) => DropdownMenuItem(
                value: c.code,
                child: Text('${c.code} (${c.symbol})'),
              ),
            )
            .toList(),
        onChanged: (code) {
          if (code != null) {
            ref.read(addExpenseFormProvider.notifier).setCurrency(code);
          }
        },
      ),
    );
  }
}
