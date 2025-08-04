import 'dart:core';

class AppUrls {
  //Base URL
  static const String baseUrl = "https://surl.signitivessoft.com";

  static const String deviceInfo = "/device-info";

  //Authentication
  static const String requestOtp = "/auth/request-code";
  static const String login = "/auth/login";

  //URL Shortener
  static const String shortUrl = "/v1/shorten";



  //Master Data
  static const String getPlans = "/plans/";

  //Qr Codes
  static const String generateQrCode = "/qr/generate";
  static const String qrCodes = "/qr/user/";


  static const String profileDetails = "/users/profile/6";


}


