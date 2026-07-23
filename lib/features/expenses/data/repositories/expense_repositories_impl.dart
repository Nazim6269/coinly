import '../../domain/entities/expense.dart';
import '../../domain/repositories/expense_repository.dart';
import '../datasources/expense_local_datasource.dart';
import '../models/expense_model.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseLocalDataSource localDataSource;
  ExpenseRepositoryImpl(this.localDataSource);

  @override
  Future<List<Expense>> getRecentExpenses({int limit = 10}) {
    return localDataSource.getRecentExpenses(limit: limit);
  }

  @override
  Future<double> getTotalSpendThisMonth() {
    return localDataSource.getTotalSpendThisMonth();
  }

  @override
  Future<Expense> addExpense(Expense expense) {
    final model = ExpenseModel(
      id: expense.id,
      amount: expense.amount,
      currencyCode: expense.currencyCode,
      category: expense.category,
      date: expense.date,
      amountInHomeCurrency: expense.amountInHomeCurrency,
      note: expense.note,
    );
    return localDataSource.addExpense(model);
  }

  @override
  Future<List<Expense>> getAllExpenses() {
    return localDataSource.getAllExpenses();
  }
}
