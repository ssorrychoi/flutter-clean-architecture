import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';
import 'package:practice_clean_architecture/data/core/api_result.dart';

class FetchCountryInfoUseCase {
  final CountryApi countryApi;

  FetchCountryInfoUseCase({required this.countryApi});

  Future<ApiResult<CountryInfoDto>> call(String countryCode) async {
    try {
      final result = await countryApi.countryCountryInfo(countryCode: countryCode);

      return ApiResult.success(data: result.data);
    } on DioError catch (e) {
      return ApiResult.error(e);
    }
  }
}
