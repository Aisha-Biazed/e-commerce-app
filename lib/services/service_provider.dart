import 'package:e_commerce_app/features/auth/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../features/store/cart/Cubit/my_cart_cubit.dart';
import '../features/store/prdoucts/cubit/products_cubit.dart';

class ServiceProvider extends StatelessWidget {
  const ServiceProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => ProductsCubit()),
        BlocProvider(create: (_) => MyCartCubit()),
      ],
      child: child,
    );
  }

  final Widget child;
}
