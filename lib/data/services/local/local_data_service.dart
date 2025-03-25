import 'package:result_dart/result_dart.dart';

class LocalDataService {
  Future<Result<Uri>> convertUrl(String url) async {
    await Future.delayed(Duration(seconds: 2));

    // url = "https://www.waze.com/ul?ll=45.576562,10.756344&navigate=yes";
    // Uri uri = Uri.parse(url);

    // // Manually encode the query parameters if they contain special characters
    // String encodedQuery = _encodeQueryParameters(uri.queryParameters);

    // // Rebuild the URL with the encoded query parameters (if any)
    // String finalUrl = "${uri.scheme}://${uri.host}${uri.path}?$encodedQuery";
    var encodedUrl = Uri.parse("https://www.waze.com/ul?ll=45.576562%2C10.756344&navigate=yes");

    return Success(encodedUrl);
  }

  // String _encodeQueryParameters(Map<String, String> params) {
  //   return params.entries
  //       .map(
  //         (MapEntry<String, String> e) =>
  //             '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
  //       )
  //       .join('&');
  // }
}
