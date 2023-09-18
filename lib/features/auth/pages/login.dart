import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/routing/router.dart';
import '../../../../core/utils/assets_manager.dart';
import '../widgets/widget_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
        ],
      ),
    );
  }
}
