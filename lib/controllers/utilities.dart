import 'package:flutter/material.dart';

double scaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return width / 375; // base design width
}

double responsiveFont(BuildContext context, double size) {
  return (size * scaleFactor(context)).clamp(12, 24);
}

double responsiveIcon(BuildContext context, double size) {
  return (size * scaleFactor(context)).clamp(16, 32);
}

double responsiveSize(BuildContext context, double size) {
  double width = MediaQuery.of(context).size.width;
  double scale = width / 375;

  return (size * scale).clamp(8, 300); // prevents extremes
}