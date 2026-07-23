import 'package:coinly/features/expenses/domain/entities/date_range_filter.dart';
import 'package:coinly/features/expenses/domain/entities/expense_category.dart';
import 'package:coinly/features/expenses/domain/usecase/filter_expenses.dart';
import 'package:coinly/features/expenses/domain/usecase/get_all_expenses.dart';
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

final getAllExpensesProvider = Provider((ref) {
  return GetAllExpenses(ref.watch(expenseRepositoryProvider));
});

final allExpensesProvider = FutureProvider((ref) {
  ref.watch(expensesRefreshProvider);
  return ref.watch(getAllExpensesProvider)();
});

final filterExpensesProvider = Provider((ref) => FilterExpenses());

//Filter state
class HistoryFilterState {
  final ExpenseCategory? category;
  final DateRangeFilter dateRangeFilter;

  const HistoryFilterState({
    this.category,
    this.dateRangeFilter = DateRangeFilter.all,
  });

  HistoryFilterState copyWith({
    ExpenseCategory? category,
    bool clearCategory = false,
    DateRangeFilter? dateRangeFilter,
  }) {
    return HistoryFilterState(
      category: clearCategory ? null : (category ?? this.category),
      dateRangeFilter: dateRangeFilter ?? this.dateRangeFilter,
    );
  }
}

final historyFilterProvider =
    NotifierProvider<HistoryFilterNotifier, HistoryFilterState>(
      HistoryFilterNotifier.new,
    );

class HistoryFilterNotifier extends Notifier<HistoryFilterState> {
  @override
  HistoryFilterState build() => const HistoryFilterState();

  void setCategory(ExpenseCategory? category) {
    state = category == null
        ? state.copyWith(clearCategory: true)
        : state.copyWith(category: category);
  }

  void setDateRange(DateRangeFilter range) {
    state = state.copyWith(dateRangeFilter: range);
  }
}

final filteredHistoryProvider = Provider<AsyncValue<List<Expense>>>((ref) {
  final filter = ref.watch(historyFilterProvider);
  final expensesAsync = ref.watch(allExpensesProvider);
  final filterFn = ref.watch(filterExpensesProvider);

  return expensesAsync.whenData((expenses) {
    return filterFn(
      expenses,
      category: filter.category,
      dateRange: filter.dateRangeFilter,
    );
  });
});
