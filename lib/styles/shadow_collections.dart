import 'package:flutter/material.dart';

class ShadowCollections {
  static List<BoxShadow> softShadow = [
    BoxShadow(
      color: const Color(0xFF6E6E6E).withOpacity(0.10),
      spreadRadius: 0,
      blurRadius: 8,
      offset: const Offset(0, 1),
    ),
  ];

  static List<BoxShadow> mediumShadow = [
    BoxShadow(
      color: const Color(0xFF6E6E6E).withOpacity(0.10),
      spreadRadius: 0,
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> blueShadow = [
    BoxShadow(
      color: const Color(0xFF1BA3E01A).withAlpha(10),
      spreadRadius: 2,
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];
}
