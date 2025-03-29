import 'package:maps_to_waze/data/services/api/api_client.dart';
import 'package:maps_to_waze/data/services/api/models/convert_url_response/convert_url_response.dart';
import 'package:result_dart/result_dart.dart';

class ApiClientDevLocal implements ApiClient {
  @override
  Future<Result<ConvertUrlResponse>> convertUrl(String url) async {
    await Future.delayed(Duration(seconds: 2));

    var response = ConvertUrlResponse(
      url: "https://www.waze.com/ul?ll=45.576562%2C10.756344&navigate=yes",
      coordinates: CoordinatesResponse(
        longitude: "10.810213",
        latitude: "45.491291",
      ),
    );

    return Success(response);
  }
}
