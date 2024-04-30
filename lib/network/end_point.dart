class BaseUrl {
  static String get dev => "https://fakestoreapi.com";
  static String get pre => "https://pre.com";
  static String get pro => "https://pro.com";
  BaseUrl._();
}

class BasicAuth {
  static BasicAuth? _instance;

  factory BasicAuth() => _instance ??= BasicAuth._();

  BasicAuth._();
  String get password => "utshrmobile";
  //field
  String get username => "utshrmobile";
}

class Endpoints {
  static const int receiveTimeout = 6 * 1000;

  // connectTimeout
  static const int connectionTimeout = 8 * 1000;

  static const String products = '/products';
  static const String refreshToken = '/refreshToken';
  Endpoints._();
  // static String leaveRequestTimeline(int requestId) =>
  //     "/api/mobile/hr/pri/leave-request/$requestId/timeline";
}
