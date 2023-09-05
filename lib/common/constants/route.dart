abstract class EndPoints {
  EndPoints._();

  static const baseUrl = "https://fakestoreapi.com/";

  static const auth = _Auth();
  static const order = _Order();
  static const product = _Product();
  static const profile = _Profile();
}

class _Auth {
  const _Auth();

  final login = 'auth/login';
  // final forgotPassword = 'forgot-password-res';
  final regesteration = 'users';
}

class _Order {
  const _Order();

  final getRestaurantOrder = 'get-restaurant-order';
  final getOrderDetail = 'restaurant-orders';
  final completeOrder = 'complete-order/';
}

class _Product {
  const _Product();

  final getProductData = 'products';
  final activeMenu = 'activate-menu';
  final increaseMenu = 'control-increase-menu';
  final decreaseMenu = 'control-decrease-menu';
}

class _Profile {
  const _Profile();

  final getUserData = 'get-user-info';
  final changeStatus = 'change-status';
  final changePassward = 'change-password-res';
}
