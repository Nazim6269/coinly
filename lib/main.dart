import 'package:coinly/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CoinlyApp());
}

class CoinlyApp extends StatelessWidget {
  const CoinlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coinly',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(body: Center(child: Text("CoinlyApp"))),
    );
  }
}
