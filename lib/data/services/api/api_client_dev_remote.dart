import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:logging/logging.dart';
import 'package:maps_to_waze/data/services/api/api_client.dart';
import 'package:maps_to_waze/data/services/api/models/convert_url_request/convert_url_request.dart';
import 'package:maps_to_waze/data/services/api/models/convert_url_response/convert_url_response.dart';
import 'package:maps_to_waze/domain/models/coordinates/coordinates.dart';
import 'package:result_dart/result_dart.dart';

class ApiClientDevRemote implements ApiClient {
  final _log = Logger("ApiClient");

  final String _host;
  final int _port;
  final HttpClient Function() _clientFactory;

  ApiClientDevRemote({
    String? host,
    int? port,
    HttpClient Function()? clientFactory,
  }) : _host = host ?? "localhost",
       _port = port ?? 8080,
       _clientFactory = clientFactory ?? HttpClient.new;

  @override
  Future<Result<ConvertUrlResponse>> convertUrl(String url) async {
    _log.info("Converting the Url");

    final client = _clientFactory();
    try {
      var requestUri = Uri.parse("$_host:$_port/convertUrl");
      var request = await client.postUrl(requestUri);
      var requestBody = ConvertUrlRequest(url: url);
      request.write(json.encode(requestBody.toJson()));
      var response = await request.close();

      if (response.statusCode != 200) {
        throw HttpException(
          "Invalid response, status code: ${response.statusCode}",
        );
      }

      var responseBodyString = await response.transform(utf8.decoder).join();
      var responseBodyJson = json.decode(responseBodyString);

      _log.info("Successfully converted url");
      return Success(ConvertUrlResponse.fromJson(responseBodyJson));
    } on Exception catch (error) {
      _log.warning("Failed to convert url: $error");
      return Failure(error);
    } finally {
      client.close();
    }
  }

  @override
  Future<Result<Uint8List>> getStaticMap(Coordinates coordinates) async {
    _log.info("Getting static map");
    final client = _clientFactory();
    try {
      var requestUri = Uri.parse(
        "$_host:$_port/staticMap",
      ).replace(queryParameters: {
        "lat": coordinates.latitude.toString(),
        "lon": coordinates.longitude.toString(),
      });

      _log.info("Request URI: $requestUri");

      var request = await client.getUrl(requestUri);
      var response = await request.close();

      if (response.statusCode != 200) {
        throw HttpException(
          "Invalid response, status code: ${response.statusCode}",
        );
      }

      // Read the response in chunks and combine them into a single Uint8List
      final data = await response.fold<Uint8List>(
        Uint8List(0),
        (previous, element) => Uint8List.fromList([...previous, ...element]),
      );

      return Success(data);
    } on Exception catch (error) {
      _log.warning("Failed to get static map: $error");
      return Failure(error);
    } finally {
      client.close();
    }
  }
}
