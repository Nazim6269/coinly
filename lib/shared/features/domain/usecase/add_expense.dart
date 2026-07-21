import 'package:coinly/shared/features/domain/entities/expense.dart';
import 'package:coinly/shared/features/domain/repositories/expense_repository.dart';

class AddExpense {
  final ExpenseRepository repository;
  AddExpense(this.repository);

  Future<Expense> call(Expense expense) {
    return repository.addExpense(expense);
  }
}
