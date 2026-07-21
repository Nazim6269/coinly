import 'package:coinly/features/dashboard/data/repositories/expense_repositories_impl.dart';
import 'package:coinly/features/dashboard/domain/repositories/expense_repository.dart';
import 'package:coinly/features/dashboard/domain/usecase/get_recent_expense.dart';
import 'package:coinly/features/dashboard/domain/usecase/get_total_spend.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/expense_local_datasource.dart';
import '../../domain/entities/expense.dart';

final expenseLocalDataSourceProvider = Provider(
  (ref) => ExpenseLocalDataSource(),
);

final expenseRepositoryProvider = Provider<ExpenseRepository>((ref) {
  return ExpenseRepositoryImpl(ref.read(expenseLocalDataSourceProvider));
});

final getRecentExpensesProvider = Provider((ref) {
  return GetRecentExpenses(ref.watch(expenseRepositoryProvider));
});

final getTotalSpendThisMonthProvider = Provider((ref) {
  return GetTotalSpendThisMonth(ref.watch(expenseRepositoryProvider));
});

final recentExpensesProvider = FutureProvider<List<Expense>>((ref) {
  return ref.watch(getRecentExpensesProvider)();
});

final totalSpendThisMonthProvider = FutureProvider<double>((ref) {
  return ref.watch(getTotalSpendThisMonthProvider)();
});
