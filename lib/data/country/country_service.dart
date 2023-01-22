import 'package:practice_clean_architecture/data/core/api_result.dart';
import 'package:practice_clean_architecture/domain/model/country/country_info_dto.dart';
import 'package:practice_clean_architecture/domain/model/country/country_v3_dto.dart';

abstract class CountryService {
  Future<ApiResult<CountryInfoDto>> fetchCountryInfo({required String countryCode});

  Future<ApiResult<List<CountryV3Dto>>> fetchAvailableCountries();
}
