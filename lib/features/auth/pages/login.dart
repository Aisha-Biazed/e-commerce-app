import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/routing/router.dart';
import '../../../../core/utils/assets_manager.dart';
import '../widgets/container_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const RSizedBox(
            height: 20,
          ),
          FadeInDown(
              delay: const Duration(milliseconds: 3800),
              child: Image.asset(ImageAssets.login)),
          ContainerLogin(),

          // Positioned(
          //     top: 0, bottom: 0, left: 0, right: 0, child: ContainerLogin()),
        ],
      ),
    );
  }
}
