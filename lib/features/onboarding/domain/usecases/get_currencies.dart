import 'package:coinly/features/onboarding/domain/entities/currency.dart';
import 'package:coinly/features/onboarding/domain/repositories/currency_repositories.dart';

class GetCurrencies {
  final CurrencyRepository repository;
  GetCurrencies(this.repository);

  Future<List<Currency>> call() {
    return repository.getCurrencies();
  }
}
