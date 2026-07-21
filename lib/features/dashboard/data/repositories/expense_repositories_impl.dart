import 'package:coinly/features/dashboard/data/datasources/expense_local_datasource.dart';
import 'package:coinly/features/dashboard/domain/entities/expense.dart';
import 'package:coinly/features/dashboard/domain/repositories/expense_repository.dart';

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
}
