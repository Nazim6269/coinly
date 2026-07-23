import 'package:coinly/features/onboarding/presentation/providers/onboarding_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';

class CurrencySearchField extends ConsumerWidget {
  const CurrencySearchField({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      onChanged: (value) =>
          ref.read(currencySearchQueryProvider.notifier).update(value),
      style: const TextStyle(color: AppColors.textOnDark),
      decoration: InputDecoration(
        hintText: 'Search currency (e.g. USD, Euro)',
        hintStyle: TextStyle(color: AppColors.textOnDark.withValues(alpha: 0.5)),
        filled: true,
        fillColor: AppColors.surface.withValues(alpha: 0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search, color: AppColors.textOnDark),
      ),
    );
  }
}
