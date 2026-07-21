import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/currency.dart';

class CurrencyTile extends StatelessWidget {
  final Currency currency;
  final bool isSelected;
  final VoidCallback onTap;

  const CurrencyTile({
    super.key,
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
