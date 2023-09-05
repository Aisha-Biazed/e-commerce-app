import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/utils/hex_color.dart';

const _lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  // primary: Color(0xFFa1c3fc),
  primary: Color(0xFFee7b64),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFFF2CB03),
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  background: Color(0xFFFCFDF6),
  onBackground: Color(0xFF1A1C18),
  surface: Color(0xFFFCFDF6),
  onSurface: Color(0xFF1A1C18),
);

class ColorManager {
  static Color primary = HexColor('#ee7b64');
  static Color mainGrey = HexColor('#F8F8F8');
  static Color white = HexColor('#FFFFFF');
  static Color dark = HexColor('#000000');
  static Color grey = HexColor('#BBBBBB');
  static Color hint = Colors.grey;
}
