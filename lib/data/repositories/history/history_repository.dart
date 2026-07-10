import 'package:maps_to_waze/data/services/local_storage/local_storage_service.dart';
import 'package:maps_to_waze/data/services/local_storage/models/conversion/conversion_entity.dart';
import 'package:maps_to_waze/domain/models/conversion/conversion.dart';
import 'package:result_dart/result_dart.dart';

class HistoryRepository {
  final LocalStorageService _localStorageService;

  HistoryRepository({required LocalStorageService localStorageService})
    : _localStorageService = localStorageService;

  Future<Result<List<Conversion>>> getConversionHistory() async {
    try {
      var conversionEntityHistory =
          await _localStorageService.getConversionHistory().getOrThrow();

      List<Conversion> result =
          conversionEntityHistory
              .map((ConversionEntity c) {
                try {
                  return Success(Conversion.fromEntity(c));
                } on Exception {
                  return null;
                }
              })
              .whereType<Success>()
              .map((Success s) => s.getOrNull() as Conversion)
              .toList();

      return Success(result);
    } on Exception catch (error) {
      return Failure(error);
    }
  }

  Future<Result> deleteConversion(Conversion conversion) async {
    try {
      return await _localStorageService.deleteConversion(conversion);
    } on Exception catch (error) {
      return Failure(error);
    }
  }

  Future<Result> updateConversion(Conversion conversion) async {
    try {
      return await _localStorageService.updateConversion(conversion);
    } on Exception catch (error) {
      return Failure(error);
    }
  }

  Future<Result<List<Conversion>>> searchConversions(String query) async {
    try {
      var filteredConversions =
          await _localStorageService.searchConversions(query).getOrThrow();

      List<Conversion> result =
          filteredConversions
              .map((ConversionEntity c) {
                try {
                  return Success(Conversion.fromEntity(c));
                } on Exception {
                  return null;
                }
              })
              .whereType<Success>()
              .map((Success s) => s.getOrNull() as Conversion)
              .toList();

      return Success(result);
    } on Exception catch (error) {
      return Failure(error);
    }
  }
}
