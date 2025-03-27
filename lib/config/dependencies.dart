import 'package:maps_to_waze/config/config.dart';
import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_respository.dart';
import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_respository_local.dart';
import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_respository_remote.dart';
import 'package:maps_to_waze/data/services/api/api_client.dart';
import 'package:maps_to_waze/data/services/development/development_data_service.dart';
import 'package:maps_to_waze/data/services/local_storage/local_storage_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providersDev {
  return [
    Provider.value(value: DevelopmentDataService()),
    Provider.value(value: LocalStorageService()),
    Provider(
      create:
          (context) =>
              UrlConversionRepositoryLocal(
                    developmentDataService: context.read<DevelopmentDataService>(),
                    localStorageService: context.read<LocalStorageService>(),
                  )
                  as UrlConversionRepository,
    ),
  ];
}

List<SingleChildWidget> get providersProd {
  return [
    Provider.value(
      value: ApiClient(
        host: ConfigProd.backendHost,
        port: ConfigProd.backendPort,
      ),
    ),
    Provider.value(value: LocalStorageService()),
    Provider(
      create:
          (context) =>
              UrlConversionRepositoryRemote(
                    apiClient: context.read<ApiClient>(),
                    localStorageService: context.read<LocalStorageService>(),
                  )
                  as UrlConversionRepository,
    ),
  ];
}
