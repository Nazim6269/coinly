import 'package:flutter/material.dart';

enum ButtonSize {
  small(
    height: 36,
    padding: EdgeInsets.symmetric(horizontal: 12),
    borderRadius: BorderRadius.all(Radius.circular(8)),
    fontSize: 13,
    iconSize: 16,
    iconSpacing: 6,
    loaderSize: 16,
    loaderStrokeWidth: 2,
  ),
  medium(
    height: 44,
    padding: EdgeInsets.symmetric(horizontal: 16),
    borderRadius: BorderRadius.all(Radius.circular(10)),
    fontSize: 14,
    iconSize: 18,
    iconSpacing: 8,
    loaderSize: 18,
    loaderStrokeWidth: 2.2,
  ),
  large(
    height: 52,
    padding: EdgeInsets.symmetric(horizontal: 20),
    borderRadius: BorderRadius.all(Radius.circular(12)),
    fontSize: 16,
    iconSize: 20,
    iconSpacing: 10,
    loaderSize: 20,
    loaderStrokeWidth: 2.4,
  );

  final double height;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final double fontSize;
  final double iconSize;
  final double iconSpacing;
  final double loaderSize;
  final double loaderStrokeWidth;

  const ButtonSize({
    required this.height,
    required this.padding,
    required this.borderRadius,
    required this.fontSize,
    required this.iconSize,
    required this.iconSpacing,
    required this.loaderSize,
    required this.loaderStrokeWidth,
  });
}

@immutable
class ButtonSizeConfig {
  final double height;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final double fontSize;
  final double iconSize;
  final double iconSpacing;
  final double loaderSize;
  final double loaderStrokeWidth;

  const ButtonSizeConfig({
    required this.height,
    required this.padding,
    required this.borderRadius,
    required this.fontSize,
    required this.iconSize,
    required this.iconSpacing,
    required this.loaderSize,
    required this.loaderStrokeWidth,
  });
}

// (Open/Closed Principle).
extension ButtonSizeX on ButtonSize {
  ButtonSizeConfig get config => ButtonSizeConfig(
    height: height,
    padding: padding,
    borderRadius: borderRadius,
    fontSize: fontSize,
    iconSize: iconSize,
    iconSpacing: iconSpacing,
    loaderSize: loaderSize,
    loaderStrokeWidth: loaderStrokeWidth,
  );
}
