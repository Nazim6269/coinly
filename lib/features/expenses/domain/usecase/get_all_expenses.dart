import 'package:coinly/features/expenses/domain/entities/expense.dart';
import 'package:coinly/features/expenses/domain/repositories/expense_repository.dart';

class GetAllExpenses {
  final ExpenseRepository repository;

  GetAllExpenses(this.repository);

  Future<List<Expense>> call() {
    return repository.getAllExpenses();
  }
}
