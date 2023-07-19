class Env {
  static const appName = String.fromEnvironment('DEFINE_APP_NAME');
  static const googleMapAPIKey = String.fromEnvironment('GOOGLE_MAP_API_KEY');
  static const web3authClientId = String.fromEnvironment('WEB3AUTH_CLIENT_ID');
  static const applicationIdIos = String.fromEnvironment('APPLICATION_ID_IOS');
  static const applicationIdAndroid =
      String.fromEnvironment('APPLICATION_ID_ANDROID');
  static const appSuffix = String.fromEnvironment('DEFINE_APP_SUFFIX');
}
