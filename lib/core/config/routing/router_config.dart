class RouterConfiguration {
  RouterConfiguration.init();

  final String kRootRoute = '/';
  final authRoutes = const _AuthRoutes._();
  final homeRoutes = const _HomeRoutes._();
  final productRoutes = const _ProductRoutes._();
  final profileRoutes = const _ProfileRoutes._();

}

class _AuthRoutes {
  const _AuthRoutes._();

  final String login = '/login';
  final String registration = '/registration';
}

class _HomeRoutes {
  const _HomeRoutes._();

  final String homeScreen = '/homeScreen';
  final String orderDetailScreen = 'OrderDetailScreen';
  final String orderDetail = 'OrderDetail';
  final String products = '/products';
}

class _ProductRoutes {
  const _ProductRoutes._();

  final String productScreen = '/productScreen';
}

class _ProfileRoutes {
  const _ProfileRoutes._();

  final String profileScreen = '/ProfileScreen';
  final String changePasswordScreen = 'ChangePasswordScreen';
}

