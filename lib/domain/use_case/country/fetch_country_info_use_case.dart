import 'package:practice_clean_architecture/data/core/api_result.dart';
import 'package:practice_clean_architecture/data/country/country_service.dart';
import 'package:practice_clean_architecture/domain/model/country/country_info_dto.dart';

class FetchCountryInfoUseCase {
  final CountryService countryService;

  FetchCountryInfoUseCase({required this.countryService});

  Future<ApiResult<CountryInfoDto>> call(String countryCode) async {
    final result = await countryService.fetchCountryInfo(countryCode: countryCode);

    return result.when(success: (success) {
      return ApiResult.success(data: success);
    }, error: (error) {
      return ApiResult.error(error);
    });
  }
}
