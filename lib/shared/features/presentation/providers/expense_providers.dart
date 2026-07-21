import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/expense_local_datasource.dart';
import '../../data/repositories/expense_repositories_impl.dart';
import '../../domain/entities/expense.dart';
import '../../domain/repositories/expense_repository.dart';
import '../../domain/usecase/add_expense.dart';
import '../../domain/usecase/get_recent_expense.dart';
import '../../domain/usecase/get_total_spend.dart';

final expenseLocalDataSourceProvider = Provider(
  (ref) => ExpenseLocalDataSource(),
);

final expenseRepositoryProvider = Provider<ExpenseRepository>((ref) {
  return ExpenseRepositoryImpl(ref.watch(expenseLocalDataSourceProvider));
});

final getRecentExpensesProvider = Provider((ref) {
  return GetRecentExpenses(ref.watch(expenseRepositoryProvider));
});

final getTotalSpendThisMonthProvider = Provider((ref) {
  return GetTotalSpendThisMonth(ref.watch(expenseRepositoryProvider));
});

final addExpenseProvider = Provider((ref) {
  return AddExpense(ref.watch(expenseRepositoryProvider));
});

final expensesRefreshProvider = NotifierProvider<ExpensesRefreshNotifier, int>(
  ExpensesRefreshNotifier.new,
);

class ExpensesRefreshNotifier extends Notifier<int> {
  @override
  int build() => 0;
  void bump() => state++;
}

final recentExpensesProvider = FutureProvider<List<Expense>>((ref) {
  ref.watch(expensesRefreshProvider);
  return ref.watch(getRecentExpensesProvider)();
});

final totalSpendThisMonthProvider = FutureProvider<double>((ref) {
  ref.watch(expensesRefreshProvider);
  return ref.watch(getTotalSpendThisMonthProvider)();
});
