import 'expense_category.dart';

class Expense {
  final String id;
  final double amount;
  final String currencyCode;
  final ExpenseCategory category;
  final DateTime date;
  final String? note;

  final double amountInHomeCurrency;

  const Expense({
    required this.id,
    required this.amount,
    required this.currencyCode,
    required this.category,
    required this.date,
    required this.amountInHomeCurrency,
    this.note,
  });
}
