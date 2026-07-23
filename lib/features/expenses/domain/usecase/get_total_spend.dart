import '../repositories/expense_repository.dart';

class GetTotalSpendThisMonth {
  final ExpenseRepository repository;
  GetTotalSpendThisMonth(this.repository);

  Future<double> call() {
    return repository.getTotalSpendThisMonth();
  }
}
