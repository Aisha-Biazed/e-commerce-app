class RouterConfiguration {
  RouterConfiguration.init();

  final String rootRoute = '/';
  final authRoutes = const _AuthRoutes._();
  final productRoutes = const _ProductRoutes._();
  // final profileRoutes = const _ProfileRoutes._();
}

class _AuthRoutes {
  const _AuthRoutes._();

  final String login = '/login';
  final String registration = 'registration';
  final String profileScreen = 'profileScreen';
}

// class _ProfileRoutes {
//   const _ProfileRoutes._();
//
//   final String profileScreen = '/ProfileScreen';
// }

class _ProductRoutes {
  const _ProductRoutes._();
  final String productScreen = '/productScreen';
  final String productDetails = 'productDetails';
  final String cart = 'cart';
}
