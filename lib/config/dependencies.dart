import 'package:maps_to_waze/data/repositories/history/history_repository.dart';
import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_repository.dart';
import 'package:maps_to_waze/data/services/api/api_client.dart';
import 'package:maps_to_waze/data/services/api/api_client_dev_remote.dart';
import 'package:maps_to_waze/data/services/api/api_client_prod.dart';
import 'package:maps_to_waze/data/services/local_storage/local_storage_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

const _env = String.fromEnvironment('env', defaultValue: 'dev');
const _backendHost =
    String.fromEnvironment('backendHost', defaultValue: 'http://127.0.0.1');
const _backendPort = int.fromEnvironment('backendPort', defaultValue: 8080);

List<SingleChildWidget> get providers {
  final isProd = _env == 'prod';
  final apiClient = isProd
      ? ApiClientProd(host: _backendHost, port: _backendPort)
      : ApiClientDevRemote(host: _backendHost, port: _backendPort) as ApiClient;

  return [
    Provider<ApiClient>.value(value: apiClient),
    Provider.value(value: LocalStorageService()),
    Provider(
      create: (context) => UrlConversionRepository(
        apiClient: context.read<ApiClient>(),
        localStorageService: context.read<LocalStorageService>(),
      ),
    ),
    Provider(
      create: (context) => HistoryRepository(
        localStorageService: context.read<LocalStorageService>(),
      ),
    ),
  ];
}
