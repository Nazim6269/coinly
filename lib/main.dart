import 'package:coinly/core/theme/app_theme.dart';
import 'package:coinly/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const CoinlyApp()));
}

class CoinlyApp extends StatelessWidget {
  const CoinlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coinly',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}
