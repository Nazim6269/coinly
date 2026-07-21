import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../onboarding/presentation/providers/onboarding_providers.dart';
import '../../../../shared/features/presentation/providers/expense_providers.dart';

class TotalSpendCard extends ConsumerWidget {
  const TotalSpendCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalAsync = ref.watch(totalSpendThisMonthProvider);
    // TODO: once settings feature exists, move this to a shared provider
    final homeCurrency = ref.watch(selectedHomeCurrencyProvider);
    final symbol = homeCurrency?.symbol ?? '\$';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'This month',
              style: TextStyle(
                color: AppColors.textOnLight.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            totalAsync.when(
              loading: () => const CircularProgressIndicator(),
              error: (err, _) => Text('Error: $err'),
              data: (total) => Text(
                '$symbol${total.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.textOnLight,
                  fontSize: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
