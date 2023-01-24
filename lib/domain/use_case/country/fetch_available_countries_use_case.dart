import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';
import 'package:practice_clean_architecture/data/core/api_result.dart';

class FetchAvailableCountriesUseCase {
  final CountryApi countryApi;

  FetchAvailableCountriesUseCase({required this.countryApi});

  Future<ApiResult<BuiltList<CountryV3Dto>>> call() async {
    try {
      final result = await countryApi.countryAvailableCountries();

      return ApiResult.success(data: result.data);
    } on DioError catch (e) {
      return ApiResult.error(e);
    }
  }
}
