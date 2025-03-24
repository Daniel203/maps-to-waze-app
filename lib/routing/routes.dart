abstract final class Routes {
  static const home = "/";
  static const history = "/history"; 
  static const convertUrlRelative = "/convertUrl";
  static String convertUrl(String url) => "/convertUrl/$url";
}

