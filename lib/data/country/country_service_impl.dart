import 'package:dio/dio.dart';
import 'package:practice_clean_architecture/data/core/api_result.dart';
import 'package:practice_clean_architecture/data/country/country_service.dart';
import 'package:practice_clean_architecture/domain/model/country/country_v3_dto.dart';
import 'package:practice_clean_architecture/domain/model/country/country_info_dto.dart';

class CountryServiceImpl implements CountryService {
  final dio = Dio();

  @override
  Future<ApiResult<CountryInfoDto>> fetchCountryInfo({required String countryCode}) async {
    try {
      final result = await dio.get(
        '$baseUrl/api/v3/CountryInfo/$countryCode',
      );

      print(result.data);

      return ApiResult.success(data: CountryInfoDto.fromJson(result.data));
    } on DioError catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<List<CountryV3Dto>>> fetchAvailableCountries() async {
    try {
      final result = await dio.get('$baseUrl/api/v3/AvailableCountries');

      final availableCountriesList = (result.data as List).map((e) => CountryV3Dto.fromJson(e)).toList();

      return ApiResult.success(data: availableCountriesList);
    } on DioError catch (e) {
      return ApiResult.error(e);
    }
  }
}
