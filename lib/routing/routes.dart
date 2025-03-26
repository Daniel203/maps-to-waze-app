import 'dart:convert';

abstract final class Routes {
  static const home = "/";
  static const history = "/history"; 
  static const convertUrlRelative = "/convertUrl";

  static String convertUrl(String url) {
    var base64EncodedUrl = base64Url.encode(
      utf8.encode(url.toString()),
    );
    return "/convertUrl/$base64EncodedUrl";
  }
}

