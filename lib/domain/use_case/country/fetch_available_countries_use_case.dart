import 'package:practice_clean_architecture/data/core/api_result.dart';
import 'package:practice_clean_architecture/data/country/country_service.dart';
import 'package:practice_clean_architecture/domain/model/country/country_v3_dto.dart';

class FetchAvailableCountriesUseCase {
  final CountryService countryService;

  FetchAvailableCountriesUseCase({required this.countryService});

  Future<ApiResult<List<CountryV3Dto>>> call() async {
    final result = await countryService.fetchAvailableCountries();

    return result.when(success: (success) {
      return ApiResult.success(data: success);
    }, error: (error) {
      return ApiResult.error(error);
    });
  }
}
