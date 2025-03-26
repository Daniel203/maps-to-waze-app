import 'package:maps_to_waze/data/services/api/models/convert_url_response/convert_url_response.dart';
import 'package:maps_to_waze/data/services/api/models/coordinates/coordinates.dart';
import 'package:result_dart/result_dart.dart';

class LocalDataService {
  Future<Result<ConvertUrlResponse>> convertUrl(String url) async {
    await Future.delayed(Duration(seconds: 2));

    var url = Uri.parse(
      "https://www.waze.com/ul?ll=45.576562%2C10.756344&navigate=yes",
    );
    var coordinates = Coordinates(
      latitude: "10.810213",
      longitude: "45.491291",
    );

    var response = ConvertUrlResponse(url: url, coordinates: coordinates);

    return Success(response);
  }
}
