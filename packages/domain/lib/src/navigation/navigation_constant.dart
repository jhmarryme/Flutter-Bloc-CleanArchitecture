class NavigationConstant {
  const NavigationConstant._();

  // path
  static const loginPath = '/login';
  static const otpPath = '/otp/:$usernamePathParam';

  // name
  static const loginName = 'login';
  static const otpName = 'otp';

  // Path params
  static const userIdPathParam = 'userId';
  static const usernamePathParam = 'username';

  // Query params
  static const emailQueryParam = 'email';
}
