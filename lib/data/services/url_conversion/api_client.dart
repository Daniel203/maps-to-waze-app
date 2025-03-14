import 'dart:convert';
import 'dart:io';
import 'package:maps_to_waze/data/services/url_conversion/models/url_conversion_api_model.dart';
import 'package:result_dart/result_dart.dart';

class ApiClient {
  final String _host;
  final int _port;
  final HttpClient Function() _clientFactory;

  ApiClient({String? host, int? port, HttpClient Function()? clientFactory})
    : _host = host ?? "localhost",
      _port = port ?? 8080,
      _clientFactory = clientFactory ?? HttpClient.new;

  Future<Result<Uri>> convertUrl(String url) async {
    final client = _clientFactory();
    try {
      var requestUri = Uri.parse("$_host:$_port/convertUrl");
      var request = await client.postUrl(requestUri);
      var requestBody = UrlConversionApiModel(url: url);
      request.write(json.encode(requestBody.toJson()));
      var response = await request.close();

      if (response.statusCode == 200) {
        Uri uri = Uri.parse(await response.transform(utf8.decoder).join());
        return Success(uri);
      }

      return Failure(HttpException("Invalid response"));
    } on Exception catch (error) {
      return Failure(error);
    } finally {
      client.close();
    }
  }
}
