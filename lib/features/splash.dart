// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flyfood_restaurant/core/api/exceptions.dart';
// import 'package:flyfood_restaurant/core/utils/extensions/build_context.dart';
// import 'package:flyfood_restaurant/core/utils/extensions/state_ext.dart';
// import 'package:flyfood_restaurant/features/app/presentation/widgets/app_svg_picture.dart';
// import 'package:flyfood_restaurant/generated/locale_keys.g.dart';
// import 'package:get_it/get_it.dart';
// import 'package:go_router/go_router.dart';
// import 'package:flyfood_restaurant/generated/assets.dart';
//
// import '../core/config/routing/router.dart';
// import 'app/domin/repositories/prefs_repository.dart';
// import 'app/presentation/widgets/app_text.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     if (GetIt.I<PrefsRepository>().registeredUser) {
//       GoHome();
//     } else {
//       goLogin();
//     }
//     super.initState();
//   }
//
//   Future<void> goLogin() async {
//     await Future.delayed(
//       const Duration(seconds: 5),
//       () => context.pushReplacementNamed(GRouter.config.authRoutes.login),
//     );
//   }
//
//   Future<void> GoHome() async {
//     await Future.delayed(
//       const Duration(seconds: 3),
//       () => context.goNamed(GRouter.config.homeRoutes.homeScreen),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: context.colorScheme.primary,
//       body: Padding(
//         padding: REdgeInsetsDirectional.only(bottom: 24),
//         child: Center(
//           child: Column(
//             children: [
//               Spacer(),
//               Image.asset(Assets.splashImage, alignment: Alignment.center),
//               Spacer(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AppText(
//                     AppStrings.MadeWithLoveInAmman,
//                     style: context.textTheme.titleMedium!.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: context.colorScheme.onPrimary),
//                   ),
//                   5.horizontalSpace,
//                   const AppSvgPicture(Assets.HeartIcon),
//                 ],
//               ),
//               10.verticalSpace,
//               AppText(
//                 AppStrings.version,
//                 style: context.textTheme.titleSmall!
//                     .copyWith(color: context.colorScheme.onPrimary),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
