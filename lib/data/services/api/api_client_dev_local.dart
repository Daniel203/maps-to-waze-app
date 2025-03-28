import 'package:maps_to_waze/data/services/api/api_client.dart';
import 'package:maps_to_waze/domain/models/url_data/url_data.dart';
import 'package:maps_to_waze/domain/models/coordinates/coordinates.dart';
import 'package:result_dart/result_dart.dart';

class ApiClientDevLocal implements ApiClient {
  @override
  Future<Result<UrlData>> convertUrl(String url) async {
    await Future.delayed(Duration(seconds: 2));

    var url = Uri.parse(
      "https://www.waze.com/ul?ll=45.576562%2C10.756344&navigate=yes",
    );
    var coordinates = Coordinates(
      longitude: "10.810213",
      latitude: "45.491291",
    );

    var response = UrlData(url: url, coordinates: coordinates);

    return Success(response);
  }
}

