import 'package:e_commerce_app/features/auth/presentation/pages/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../../../core/config/routing/router.dart';
import '../common/constants/constants.dart';
import '../core/config/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: designSize,
      builder: (context, child) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: FocusManager.instance.primaryFocus?.unfocus,
          child: MaterialApp.router(
            title: "E-Commerce App",
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(context),
            routerConfig: GRouter.router,
            // home: LoginScreen(),
          )),
    );
  }
}
