import 'package:get/get.dart';
import 'package:practice_clean_architecture/data/country/country_service_impl.dart';
import 'package:practice_clean_architecture/data/long_weekend/long_weekend_service_impl.dart';
import 'package:practice_clean_architecture/data/version/version_service_impl.dart';
import 'package:practice_clean_architecture/domain/use_case/country/fetch_available_countries_use_case.dart';
import 'package:practice_clean_architecture/domain/use_case/country/fetch_country_info_use_case.dart';
import 'package:practice_clean_architecture/domain/use_case/long_weekend/fetch_long_weekend_list_by_year_use_case.dart';
import 'package:practice_clean_architecture/domain/use_case/version/fetch_library_version_use_case.dart';
import 'package:practice_clean_architecture/screen/calculated_holidays/calculated_holidays_screen_view_model.dart';

class CalculatedHolidaysBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CalculatedHolidaysScreenViewModel(
        fetchLibraryVersionUseCase: FetchLibraryVersionUseCase(
          versionService: VersionServiceImpl(),
        ),
        fetchAvailableCountriesUseCase: FetchAvailableCountriesUseCase(
          countryService: CountryServiceImpl(),
        ),
        fetchCountryInfoUseCase: FetchCountryInfoUseCase(
          countryService: CountryServiceImpl(),
        ),
        fetchLongWeekendListByYearUseCase: FetchLongWeekendListByYearUseCase(
          longWeekendService: LongWeekendServiceImpl(),
        ),
      ),
    );
  }
}
