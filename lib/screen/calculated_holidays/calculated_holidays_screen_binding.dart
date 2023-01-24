import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:openapi/openapi.dart';
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
        fetchLibraryVersionUseCase: FetchlibraryVersionUseCase(
          versionApi: VersionApi(
              Dio()
                ..options.baseUrl = 'https://date.nager.at'
                ..options.headers['Content-Type'] = 'application/json',
              standardSerializers),
        ),
        fetchAvailableCountriesUseCase: FetchAvailableCountriesUseCase(
          countryApi: CountryApi(
              Dio()
                ..options.baseUrl = 'https://date.nager.at'
                ..options.headers['Content-Type'] = 'application/json',
              standardSerializers),
        ),
        fetchCountryInfoUseCase: FetchCountryInfoUseCase(
          countryApi: CountryApi(
              Dio()
                ..options.baseUrl = 'https://date.nager.at'
                ..options.headers['Content-Type'] = 'application/json',
              standardSerializers),
        ),
        fetchLongWeekendListByYearUseCase: FetchLongWeekendListByYearUseCase(
          longWeekendApi: LongWeekendApi(
              Dio()
                ..options.baseUrl = 'https://date.nager.at'
                ..options.headers['Content-Type'] = 'application/json',
              standardSerializers),
        ),
      ),
    );
  }
}
