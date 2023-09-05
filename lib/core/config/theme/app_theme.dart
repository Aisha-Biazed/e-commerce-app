import 'package:e_commerce_app/core/utils/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/core/config/theme/typography.dart';

part 'color_scheme.dart';
part 'utils.dart';

const defaultAppTheme = ThemeMode.system;

final mapAppThemeMode = <String, ThemeMode>{
  ThemeMode.light.name: ThemeMode.light,
  ThemeMode.system.name: ThemeMode.system,
};

var sysBrightness =
    SchedulerBinding.instance.platformDispatcher.platformBrightness;

ThemeData getAppTheme(ThemeMode mode, BuildContext context) {
  final mapAppTheme = <ThemeMode, ThemeData>{
    ThemeMode.light: AppTheme.light(context),
  };

  return mapAppTheme[mode]!;
}

class AppTheme {
  static ThemeData get _builtInLightTheme => ThemeData.light();
  static ThemeData light(BuildContext context) {
    final textTheme = appTextTheme(
      context,
      _builtInLightTheme.textTheme,
      _lightColorScheme.onBackground,
    );

    return _builtInLightTheme.copyWith(
      colorScheme: _lightColorScheme,
      textTheme: textTheme,
      useMaterial3: true,
      typography: Typography.material2021(),
      elevatedButtonTheme: _elevatedButtonTheme(_lightColorScheme, textTheme),
      textButtonTheme: _textButtonTheme(_lightColorScheme, textTheme),
      primaryColor: _lightColorScheme.primary,
    );
  }
}
