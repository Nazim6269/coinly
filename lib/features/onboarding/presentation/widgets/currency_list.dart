import 'package:coinly/features/onboarding/presentation/widgets/currency_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/onboarding_providers.dart';

class CurrencyList extends ConsumerWidget {
  const CurrencyList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredCurrencies = ref.watch(filteredCurrencyListProvider);
    final selected = ref.watch(selectedHomeCurrencyProvider);

    return filteredCurrencies.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Error: $err')),
      data: (currencies) => ListView.builder(
        itemCount: currencies.length,
        itemBuilder: (context, index) {
          final currency = currencies[index];
          final isSelected = selected?.code == currency.code;
          return CurrencyTile(
            currency: currency,
            isSelected: isSelected,
            onTap: () => ref
                .read(selectedHomeCurrencyProvider.notifier)
                .select(currency),
          );
        },
      ),
    );
  }
}
