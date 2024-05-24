import 'package:flutter_clearmind_archetype_shared/shared.dart';

class NavigationConstant {
  const NavigationConstant._();

  // path
  static const loginPath = '/login';
  static const otpPath = '/otp/:$usernamePathParam';

  static const myPageOtpPath = '/${NavigationConstants.myPagePath}/otp/:$usernamePathParam';

  // name
  static const loginName = 'login';
  static const otpName = 'otp';
  static const myPageOtpName = 'myPageOtp';

  // Path params
  static const userIdPathParam = 'userId';
  static const usernamePathParam = 'username';

  // Query params
  static const emailQueryParam = 'email';
}
