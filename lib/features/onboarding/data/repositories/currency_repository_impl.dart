import 'package:coinly/features/onboarding/data/datasources/currency_local_datasource.dart';
import 'package:coinly/features/onboarding/domain/entities/currency.dart';
import 'package:coinly/features/onboarding/domain/repositories/currency_repositories.dart';

class CurrencyRepositoryImpl extends CurrencyRepository {
  final CurrencyLocalDataSource localDataSource;

  CurrencyRepositoryImpl(this.localDataSource);

  @override
  Future<List<Currency>> getCurrencies() {
    return localDataSource.getCurrencies();
  }
}

