import 'dart:convert';
import 'dart:io';
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
      var request = await client.post(_host, _port, "/convertUrl");
      request.write(jsonEncode({"url": url}));
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
