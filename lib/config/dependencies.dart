import 'package:maps_to_waze/config/config.dart';
import 'package:maps_to_waze/data/repositories/history/history_repository.dart';
import 'package:maps_to_waze/data/repositories/history/history_repository_dev.dart';
import 'package:maps_to_waze/data/repositories/history/history_repository_prod.dart';
import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_repository.dart';
import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_repository_dev.dart';
import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_repository_prod.dart';
import 'package:maps_to_waze/data/services/api/api_client_dev_local.dart';
import 'package:maps_to_waze/data/services/api/api_client_dev_remote.dart';
import 'package:maps_to_waze/data/services/api/api_client_prod.dart';
import 'package:maps_to_waze/data/services/local_storage/local_storage_service_dev.dart';
import 'package:maps_to_waze/data/services/local_storage/local_storage_service_prod.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providersDev {
  return [
    Provider.value(
      value: ApiClientDevRemote(
        host: ConfigDev.backendHost,
        port: ConfigDev.backendPort,
      ),
    ),
    Provider.value(value: ApiClientDevLocal()),
    Provider.value(value: LocalStorageServiceDev()),
    Provider(
      create:
          (context) =>
              UrlConversionRepositoryDev(
                    apiClient: context.read<ApiClientDevRemote>(),
                    localStorageService: context.read<LocalStorageServiceDev>(),
                  )
                  as UrlConversionRepository,
    ),
    Provider(
      create:
          (context) =>
              HistoryRepositoryDev(
                    localStorageService: context.read<LocalStorageServiceDev>(),
                  )
                  as HistoryRepository,
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
                    apiClient: context.read<ApiClientProd>(),
                    localStorageService:
                        context.read<LocalStorageServiceProd>(),
                  )
                  as UrlConversionRepository,
    ),
    Provider(
      create:
          (context) =>
              HistoryRepositoryProd(
                    localStorageService: context.read<LocalStorageServiceDev>(),
                  )
                  as HistoryRepository,
    ),
  ];
}
