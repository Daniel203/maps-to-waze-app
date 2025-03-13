import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_respository.dart';
import 'package:maps_to_waze/data/services/url_conversion/api_client.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providers {
  return [
    Provider.value(value: ApiClient()),
    Provider(create: (context) => UrlConversionRepository(apiClient: context.read<ApiClient>()))
  ];
}
