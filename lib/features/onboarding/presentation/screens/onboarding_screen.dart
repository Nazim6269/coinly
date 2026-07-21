import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/currency.dart';
import '../providers/onboarding_providers.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final filteredCurrencies = ref.watch(filteredCurrencyListProvider);
    final selected = ref.watch(selectedHomeCurrencyProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Text('Welcome to Coinly', style: textTheme.displayLarge),
              const SizedBox(height: 8),
              Text(
                'What currency do you call home?',
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              TextField(
                onChanged: (value) => ref
                    .read(currencySearchQueryProvider.notifier)
                    .update(value),
                style: const TextStyle(color: AppColors.textOnDark),
                decoration: InputDecoration(
                  hintText: 'Search currency (e.g. USD, Euro)',
                  hintStyle: TextStyle(
                    color: AppColors.textOnDark.withOpacity(0.5),
                  ),
                  filled: true,
                  fillColor: AppColors.surface.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.textOnDark,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: filteredCurrencies.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (err, _) => Center(child: Text('Error: $err')),
                  data: (currencies) => ListView.builder(
                    itemCount: currencies.length,
                    itemBuilder: (context, index) {
                      final currency = currencies[index];
                      final isSelected = selected?.code == currency.code;
                      return _CurrencyTile(
                        currency: currency,
                        isSelected: isSelected,
                        onTap: () => ref
                            .read(selectedHomeCurrencyProvider.notifier)
                            .select(currency),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    onPressed: selected == null
                        ? null
                        : () {
                            // TODO: persist via usecase in Phase 2 (Supabase)
                            debugPrint(
                              'Selected home currency: ${selected.code}',
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryAccent,
                      foregroundColor: AppColors.inkNavy,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CurrencyTile extends StatelessWidget {
  final Currency currency;
  final bool isSelected;
  final VoidCallback onTap;

  const _CurrencyTile({
    required this.currency,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color: isSelected ? AppColors.primaryAccent : AppColors.surface,
      child: ListTile(
        onTap: onTap,
        leading: Text(
          currency.symbol,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.inkNavy,
          ),
        ),
        title: Text(
          currency.name,
          style: const TextStyle(
            color: AppColors.inkNavy,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          currency.code,
          style: TextStyle(color: AppColors.inkNavy.withOpacity(0.6)),
        ),
        trailing: isSelected
            ? const Icon(Icons.check_circle, color: AppColors.inkNavy)
            : null,
      ),
    );
  }
}

