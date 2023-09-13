part of 'app_theme.dart';

ElevatedButtonThemeData _elevatedButtonTheme(
        ColorScheme scheme, TextTheme textTheme) =>
    ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: textTheme.labelLarge?.r,
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        disabledBackgroundColor: scheme.onSurface,
        minimumSize: Size(double.infinity, 55.h),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      ),
    );

TextButtonThemeData _textButtonTheme(ColorScheme scheme, TextTheme textTheme) =>
    TextButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: textTheme.labelLarge,
        foregroundColor: ColorManager.grey,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      ),
    );

final double kbrBorderTextField = 10.r;
