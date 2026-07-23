import '../entities/date_range_filter.dart';
import '../entities/expense.dart';
import '../entities/expense_category.dart';

class FilterExpenses {
  List<Expense> call(
    List<Expense> expenses, {
    ExpenseCategory? category,
    DateRangeFilter dateRange = DateRangeFilter.all,
  }) {
    final now = DateTime.now();

    return expenses.where((e) {
      final matchesCategory = category == null || e.category == category;
      final matchesDate = switch (dateRange) {
        DateRangeFilter.today =>
          e.date.year == now.year &&
              e.date.month == now.month &&
              e.date.day == now.day,
        DateRangeFilter.thisWeek => now.difference(e.date).inDays <= 7,
        DateRangeFilter.thisMonth =>
          e.date.year == now.year && e.date.month == now.month,
        DateRangeFilter.all => true,
      };
      return matchesCategory && matchesDate;
    }).toList()..sort((a, b) => b.date.compareTo(a.date));
  }
}
