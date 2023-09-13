import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/utils/hex_color.dart';

const _lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  // primary: Color(0xFFa1c3fc),
  primary: Color(0xffe7cedc),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFFF8F8F8),
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
  static Color hint = HexColor('#9E9E9EFF');
  static Color purple = HexColor('#E0E1EF');
  static Color secondaryGrey = HexColor('#69696A');
  static Color amber = HexColor('#ffc107');
  static Color btnColor = HexColor('#0f172a');
}
