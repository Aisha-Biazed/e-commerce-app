import 'package:bot_toast/bot_toast.dart';
import 'package:e_commerce_app/features/auth/cubit/cubit.dart';
import 'package:e_commerce_app/features/auth/cubit/states.dart';
import 'package:e_commerce_app/features/auth/pages/profile.dart';
import 'package:e_commerce_app/features/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:e_commerce_app/features/auth/presentation/pages/registration.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../common/constants/cash_helper.dart';
import '../common/constants/constants.dart';
import '../core/config/routing/router.dart';
import '../core/config/theme/app_theme.dart';
import '../features/auth/pages/login.dart';
import '../features/store/prdoucts/pages/details_products_page.dart';
import '../features/store/prdoucts/pages/products_page.dart';
import '../services/service_provider.dart';

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
              child: ServiceProvider(
                child: BlocBuilder<AuthCubit, AuthStates>(
                  builder: (context, state) {
                    return MaterialApp.router(
                        builder: BotToastInit(),
                        title: "E-Commerce App",
                        debugShowCheckedModeBanner: false,
                        theme: AppTheme.light(context),
                        routerConfig: GRouter.router);
                    // home: ProductsPage(),
                    // home: CachHelper.sharedPreferences.getString('token') !=
                    //         null
                    //     ? const SplashPage()
                    //     : const ProductsPage());
                  },
                ),
              ),
            ));
  }
}
