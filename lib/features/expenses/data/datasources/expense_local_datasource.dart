import '../../domain/entities/expense_category.dart';
import '../models/expense_model.dart';

class ExpenseLocalDataSource {
  final _now = DateTime.now();
  late final List<ExpenseModel> _expenses = [
    ExpenseModel(
      id: '1',
      amount: 350,
      currencyCode: 'THB',
      category: ExpenseCategory.food,
      date: _now.subtract(const Duration(hours: 3)),
      amountInHomeCurrency: 9.8,
      note: 'Pad thai dinner',
    ),
    ExpenseModel(
      id: '2',
      amount: 1200,
      currencyCode: 'THB',
      category: ExpenseCategory.accommodation,
      date: _now.subtract(const Duration(days: 1)),
      amountInHomeCurrency: 33.6,
      note: 'Hostel — 2 nights',
    ),
    ExpenseModel(
      id: '3',
      amount: 80,
      currencyCode: 'THB',
      category: ExpenseCategory.transport,
      date: _now.subtract(const Duration(days: 1, hours: 4)),
      amountInHomeCurrency: 2.2,
      note: 'Tuk-tuk',
    ),
    ExpenseModel(
      id: '4',
      amount: 600,
      currencyCode: 'THB',
      category: ExpenseCategory.shopping,
      date: _now.subtract(const Duration(days: 2)),
      amountInHomeCurrency: 16.8,
      note: 'Souvenirs',
    ),
    ExpenseModel(
      id: '5',
      amount: 250,
      currencyCode: 'THB',
      category: ExpenseCategory.entertainment,
      date: _now.subtract(const Duration(days: 3)),
      amountInHomeCurrency: 7.0,
      note: 'Muay Thai show',
    ),
  ];

  Future<List<ExpenseModel>> getRecentExpenses({int limit = 10}) async {
    final sorted = [..._expenses]..sort((a, b) => b.date.compareTo(a.date));
    return sorted.take(limit).toList();
  }

  Future<double> getTotalSpendThisMonth() async {
    return _expenses
        .where((e) => e.date.month == _now.month && e.date.year == _now.year)
        .fold<double>(0.0, (sum, e) => sum + e.amountInHomeCurrency);
  }

  Future<ExpenseModel> addExpense(ExpenseModel expense) async {
    _expenses.add(expense);
    return expense;
  }

  Future<List<ExpenseModel>> getAllExpenses() async {
    final sorted = [..._expenses]..sort((a, b) => b.date.compareTo(a.date));
    return sorted;
  }
}
