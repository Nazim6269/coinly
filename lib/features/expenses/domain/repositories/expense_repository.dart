import '../entities/expense.dart';

abstract class ExpenseRepository {
  Future<List<Expense>> getRecentExpenses({int limit = 10});
  Future<double> getTotalSpendThisMonth();
  Future<Expense> addExpense(Expense expense);
  Future<List<Expense>> getAllExpenses();
}
