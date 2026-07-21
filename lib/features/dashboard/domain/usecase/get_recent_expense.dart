import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

class GetRecentExpenses {
  final ExpenseRepository repository;
  GetRecentExpenses(this.repository);

  Future<List<Expense>> call({int limit = 10}) {
    return repository.getRecentExpenses(limit: limit);
  }
}
