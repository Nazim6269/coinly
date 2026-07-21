import 'package:coinly/features/onboarding/data/models/currency_model.dart';

class CurrencyLocalDataSource {
  Future<List<CurrencyModel>> getCurrencies() async {
    return const [
      CurrencyModel(code: 'USD', name: 'US Dollar', symbol: '\$'),
      CurrencyModel(code: 'EUR', name: 'Euro', symbol: '€'),
      CurrencyModel(code: 'GBP', name: 'British Pound', symbol: '£'),
      CurrencyModel(code: 'THB', name: 'Thai Baht', symbol: '฿'),
      CurrencyModel(code: 'JPY', name: 'Japanese Yen', symbol: '¥'),
      CurrencyModel(code: 'VND', name: 'Vietnamese Dong', symbol: '₫'),
      CurrencyModel(code: 'BDT', name: 'Bangladeshi Taka', symbol: '৳'),
      CurrencyModel(code: 'INR', name: 'Indian Rupee', symbol: '₹'),
      CurrencyModel(code: 'AUD', name: 'Australian Dollar', symbol: '\$'),
      CurrencyModel(code: 'MXN', name: 'Mexican Peso', symbol: '\$'),
    ];
  }
}
