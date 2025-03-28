import 'package:maps_to_waze/config/config.dart';
import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_respository.dart';
import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_respository_dev.dart';
import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_respository_prod.dart';
import 'package:maps_to_waze/data/services/api/api_client.dart';
import 'package:maps_to_waze/data/services/api/api_client_dev_local.dart';
import 'package:maps_to_waze/data/services/api/api_client_prod.dart';
import 'package:maps_to_waze/data/services/local_storage/local_storage_service_dev.dart';
import 'package:maps_to_waze/data/services/local_storage/local_storage_service_prod.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providersDev {
  return [
    Provider.value(value: ApiClientDevLocal()),
    Provider.value(value: LocalStorageServiceDev()),
    Provider(
      create:
          (context) =>
              UrlConversionRepositoryDev(
                    apiClient: context.read<ApiClientDevLocal>(),
                    localStorageService: context.read<LocalStorageServiceDev>(),
                  )
                  as UrlConversionRepository,
    ),
  ];
}

List<SingleChildWidget> get providersProd {
  return [
    Provider.value(
      value: ApiClientProd(
        host: ConfigProd.backendHost,
        port: ConfigProd.backendPort,
      ),
    ),
    Provider.value(value: LocalStorageServiceProd()),
    Provider(
      create:
          (context) =>
              UrlConversionRepositoryProd(
                    apiClient: context.read<ApiClient>(),
                    localStorageService: context.read<LocalStorageServiceProd>(),
                  )
                  as UrlConversionRepository,
    ),
  ];
}
