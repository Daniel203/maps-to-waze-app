import 'package:result_dart/result_dart.dart';

class LocalDataService {
  Future<Result<Uri>> convertUrl(String url) async {
    await Future.delayed(Duration(seconds: 2));
    var uri = Uri.parse(
      "https://www.waze.com/ul?ll=45.576562,10.756344&navigate=yes",
    );
    return Success(uri);
  }
}
