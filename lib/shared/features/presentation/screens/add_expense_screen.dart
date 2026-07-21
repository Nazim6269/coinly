import 'package:flutter/material.dart';
import '../widgets/amount_input.dart';
import '../widgets/currency_picker_field.dart';
import '../widgets/category_picker.dart';
import '../widgets/date_picker_field.dart';
import '../widgets/note_field.dart';
import '../widgets/save_expense_button.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Expense')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(child: AmountInput()),
                CurrencyPickerField(),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Category'),
            const SizedBox(height: 8),
            const CategoryPicker(),
            const SizedBox(height: 24),
            const DatePickerField(),
            const SizedBox(height: 24),
            const NoteField(),
            const SizedBox(height: 32),
            const SaveExpenseButton(),
          ],
        ),
      ),
    );
  }
}
