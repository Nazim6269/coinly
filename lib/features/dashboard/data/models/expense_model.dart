import '../../domain/entities/expense.dart';
import '../../domain/entities/expense_category.dart';

class ExpenseModel extends Expense {
  const ExpenseModel({
    required super.id,
    required super.amount,
    required super.currencyCode,
    required super.category,
    required super.date,
    required super.amountInHomeCurrency,
    super.note,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      currencyCode: json['currency_code'] as String,
      category: ExpenseCategory.values.byName(json['category'] as String),
      date: DateTime.parse(json['date'] as String),
      amountInHomeCurrency: (json['amount_in_home_currency'] as num).toDouble(),
      note: json['note'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'amount': amount,
    'currency_code': currencyCode,
    'category': category.name,
    'date': date.toIso8601String(),
    'amount_in_home_currency': amountInHomeCurrency,
    'note': note,
  };
}
