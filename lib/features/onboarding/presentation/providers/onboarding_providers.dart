import 'package:coinly/features/onboarding/domain/repositories/currency_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/currency_local_datasource.dart';
import '../../data/repositories/currency_repository_impl.dart';
import '../../domain/entities/currency.dart';
import '../../domain/usecases/get_currencies.dart';

// Dependency wiring — swap CurrencyLocalDataSource for a remote one later
// and nothing else in the app needs to change.
final currencyLocalDataSourceProvider = Provider(
  (ref) => CurrencyLocalDataSource(),
);

final currencyRepositoryProvider = Provider<CurrencyRepository>((ref) {
  return CurrencyRepositoryImpl(ref.watch(currencyLocalDataSourceProvider));
});

final getCurrenciesProvider = Provider((ref) {
  return GetCurrencies(ref.watch(currencyRepositoryProvider));
});

// Fetches the currency list
final currencyListProvider = FutureProvider<List<Currency>>((ref) {
  return ref.watch(getCurrenciesProvider)();
});

// Holds the search query — Notifier instead of StateProvider
class CurrencySearchQueryNotifier extends Notifier<String> {
  @override
  String build() => '';

  void update(String query) => state = query;
}

final currencySearchQueryProvider =
    NotifierProvider<CurrencySearchQueryNotifier, String>(
      CurrencySearchQueryNotifier.new,
    );

// Filters the list based on the query
final filteredCurrencyListProvider = Provider<AsyncValue<List<Currency>>>((
  ref,
) {
  final query = ref.watch(currencySearchQueryProvider).toLowerCase();
  final currenciesAsync = ref.watch(currencyListProvider);

  return currenciesAsync.whenData((currencies) {
    if (query.isEmpty) return currencies;
    return currencies
        .where(
          (c) =>
              c.name.toLowerCase().contains(query) ||
              c.code.toLowerCase().contains(query),
        )
        .toList();
  });
});

class SelectedHomeCurrencyNotifier extends Notifier<Currency?> {
  @override
  Currency? build() => null;

  void select(Currency currency) => state = currency;
}

final selectedHomeCurrencyProvider =
    NotifierProvider<SelectedHomeCurrencyNotifier, Currency?>(
      SelectedHomeCurrencyNotifier.new,
    );
