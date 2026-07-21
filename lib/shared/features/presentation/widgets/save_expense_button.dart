import 'package:coinly/shared/widgets/generic-button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/expense.dart';
import '../providers/add_expense_form_provider.dart';
import '../providers/expense_providers.dart';

class SaveExpenseButton extends ConsumerWidget {
  const SaveExpenseButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(addExpenseFormProvider);

    return SizedBox(
      width: double.infinity,
      child: GenericButton(
        onPressed: !form.isValid
            ? null
            : () async {
                final expense = Expense(
                  id: DateTime.now().microsecondsSinceEpoch.toString(),
                  amount: form.amount!,
                  currencyCode: form.currencyCode,
                  category: form.category,
                  date: form.date,
                  note: form.note.isEmpty ? null : form.note,
                  // TODO: real conversion via exchange-rate API in Phase 3.
                  // Mocked 1:1 for now so the dashboard total still updates.
                  amountInHomeCurrency: form.amount!,
                );
                await ref.read(addExpenseProvider)(expense);
                ref.read(expensesRefreshProvider.notifier).bump();
                ref.read(addExpenseFormProvider.notifier).reset();
                if (context.mounted) Navigator.of(context).pop();
              },

        text: "Save expense",
      ),
    );
  }
}
