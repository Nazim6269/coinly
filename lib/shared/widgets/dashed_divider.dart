import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class DashedDivider extends StatelessWidget {
  const DashedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const dashWidth = 6.0;
        const gap = 4.0;
        final count = (constraints.maxWidth / (dashWidth + gap)).floor();
        return Row(
          children: List.generate(count, (_) {
            return Padding(
              padding: const EdgeInsets.only(right: gap),
              child: Container(
                width: dashWidth,
                height: 1,
                color: AppColors.textOnDark.withOpacity(0.15),
              ),
            );
          }),
        );
      },
    );
  }
}
