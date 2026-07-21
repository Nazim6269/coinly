import 'package:coinly/features/onboarding/presentation/widgets/continue_onboarding_button.dart';
import 'package:coinly/features/onboarding/presentation/widgets/currency_list.dart';
import 'package:coinly/features/onboarding/presentation/widgets/currency_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

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
              CurrencySearchField(),
              const SizedBox(height: 16),
              Expanded(child: CurrencyList()),
              OnboardingContinueButton(),
            ],
          ),
        ),
      ),
    );
  }
}
