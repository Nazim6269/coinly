import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../features/onboarding/presentation/providers/onboarding_providers.dart';
import '../../domain/entities/expense_category.dart';

final addExpenseFormProvider =
    NotifierProvider<AddExpenseFormNotifier, AddExpenseFormState>(
      AddExpenseFormNotifier.new,
    );

class AddExpenseFormState {
  final double? amount;
  final String currencyCode;
  final ExpenseCategory category;
  final DateTime date;
  final String note;

  const AddExpenseFormState({
    this.amount,
    required this.currencyCode,
    this.category = ExpenseCategory.food,
    required this.date,
    this.note = '',
  });

  bool get isValid => amount != null && amount! > 0;

  AddExpenseFormState copyWith({
    double? amount,
    String? currencyCode,
    ExpenseCategory? category,
    DateTime? date,
    String? note,
  }) {
    return AddExpenseFormState(
      amount: amount ?? this.amount,
      currencyCode: currencyCode ?? this.currencyCode,
      category: category ?? this.category,
      date: date ?? this.date,
      note: note ?? this.note,
    );
  }
}

class AddExpenseFormNotifier extends Notifier<AddExpenseFormState> {
  @override
  AddExpenseFormState build() {
    final home = ref.read(selectedHomeCurrencyProvider);
    return AddExpenseFormState(
      currencyCode: home?.code ?? 'USD',
      date: DateTime.now(),
    );
  }

  void setAmount(String raw) =>
      state = state.copyWith(amount: double.tryParse(raw));
  void setCurrency(String code) => state = state.copyWith(currencyCode: code);
  void setCategory(ExpenseCategory category) =>
      state = state.copyWith(category: category);
  void setDate(DateTime date) => state = state.copyWith(date: date);
  void setNote(String note) => state = state.copyWith(note: note);

  void reset() => state = build();
}
