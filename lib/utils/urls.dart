class Urls {
  static const String base = ".twincloud.app";
  static const String baseUrl = '$base/api/v1';
  static const String subDomain =
      "https://flour${baseUrl}/app_dashboard/verify_subdomain?subdomain=";

  static const String appVersionURL =
      '$baseUrl/app_config/get_app_version?app_name=';
  static const String authenticationURL = '$baseUrl/authenticate?';
  static const String loadDashboardUrl = '$baseUrl/associations/dashboard/load';
  static const String signoutUrl = '$baseUrl/authentication/logout';
  static const String appUpdate =
      "https://twincloud.app/api/v1/app_config/get_app_version?app_name=";
}
