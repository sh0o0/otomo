import 'package:flutter/material.dart';

abstract class Spaces {
  Spaces._();

  static const h8 = SizedBox(height: 8);
  static const h16 = SizedBox(height: 16);
  static const h24 = SizedBox(height: 24);
  static const h32 = SizedBox(height: 32);
  static const h40 = SizedBox(height: 40);

  static const w8 = SizedBox(width: 8);
  static const w16 = SizedBox(width: 16);
  static const w24 = SizedBox(width: 24);
  static const w32 = SizedBox(width: 32);
  static const w40 = SizedBox(width: 40);
}
