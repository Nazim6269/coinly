import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/generic-button/button.dart';
import '../providers/onboarding_providers.dart';

class OnboardingContinueButton extends ConsumerWidget {
  const OnboardingContinueButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedHomeCurrencyProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: GenericButton(
        text: 'Continue',
        onPressed: selected == null
            ? null
            : () {
                debugPrint('Selected home currency: ${selected.code}');
              },
        widthMode: ButtonWidthMode.fullWidth,
        size: ButtonSize.large,
        backgroundColor: AppColors.primaryAccent,
        foregroundColor: AppColors.inkNavy,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
        variant: ButtonVariant.danger,
      ),
    );
  }
}
