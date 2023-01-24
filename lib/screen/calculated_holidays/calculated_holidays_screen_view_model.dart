import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openapi/openapi.dart';
import 'package:practice_clean_architecture/domain/use_case/country/fetch_available_countries_use_case.dart';
import 'package:practice_clean_architecture/domain/use_case/country/fetch_country_info_use_case.dart';
import 'package:practice_clean_architecture/domain/use_case/long_weekend/fetch_long_weekend_list_by_year_use_case.dart';
import 'package:practice_clean_architecture/domain/use_case/version/fetch_library_version_use_case.dart';

class CalculatedHolidaysScreenViewModel extends GetxController {
  FetchlibraryVersionUseCase fetchLibraryVersionUseCase;
  FetchAvailableCountriesUseCase fetchAvailableCountriesUseCase;
  FetchCountryInfoUseCase fetchCountryInfoUseCase;
  FetchLongWeekendListByYearUseCase fetchLongWeekendListByYearUseCase;

  CalculatedHolidaysScreenViewModel({
    required this.fetchLibraryVersionUseCase,
    required this.fetchAvailableCountriesUseCase,
    required this.fetchCountryInfoUseCase,
    required this.fetchLongWeekendListByYearUseCase,
  });

  final _isFetchLoading = true.obs;
  get isFetchingLoading => _isFetchLoading.value;

  final _isCountryInfoLoading = true.obs;
  get isCountryInfoLoading => _isCountryInfoLoading.value;

  final _isLongWeekendLoading = false.obs;
  get isLongWeekendLoading => _isLongWeekendLoading.value;

  final _versionInfo = VersionInfoDto().obs;
  get versionInfo => _versionInfo.value;

  final _countryList = <CountryV3Dto>[].obs;
  get countryList => _countryList;

  final _selectedCountry = CountryV3Dto().obs;
  get selectedCountry => _selectedCountry.value;

  final _countryInfo = CountryInfoDto().obs;
  get countryInfo => _countryInfo.value;

  final _longWeekendList = <LongWeekendV3Dto>[].obs;
  get longWeekendList => _longWeekendList;

  final _yearController = TextEditingController().obs;
  get yearController => _yearController.value;

  final _isBlankYearText = true.obs;
  get isBlankYearText => _isBlankYearText.value;

  final _yearFocusNode = FocusNode().obs;
  get yearFocusNode => _yearFocusNode.value;

  toggleKeyboard() {
    if (_yearFocusNode.value.hasFocus) {
      _yearFocusNode.value.unfocus();
    }
  }

  changeFetchLoadingStatus(bool value) {
    _isFetchLoading.value = value;
  }

  changeCountryInfoLoadingStatus(bool value) {
    _isCountryInfoLoading.value = value;
  }

  changeLongWeekendLoadingStatus(bool value) {
    _isLongWeekendLoading.value = value;
  }

  selectCountry(CountryV3Dto value) async {
    _selectedCountry.value = value;
    await fetchCountryInfo(value.countryCode!);
  }

  Future<void> fetchLibraryVersion() async {
    print('fetchLibraryVersion');
    changeFetchLoadingStatus(true);
    final result = await fetchLibraryVersionUseCase();
    result.when(success: (success) {
      print(success);
      _versionInfo.value = success!;
      changeFetchLoadingStatus(false);
    }, error: (error) {
      changeFetchLoadingStatus(false);
    });
  }

  Future<void> fetchAvailabelCountries() async {
    changeFetchLoadingStatus(true);
    final result = await fetchAvailableCountriesUseCase();

    result.when(
        success: (success) async {
          _countryList.clear();
          print(success);
          _countryList.addAll(success!);
          selectCountry(success[0]);
          await fetchCountryInfo(_selectedCountry.value.countryCode!);
        },
        error: (error) {});
  }

  Future<void> fetchCountryInfo(String countryCode) async {
    changeCountryInfoLoadingStatus(true);
    final result = await fetchCountryInfoUseCase(countryCode);

    result.when(success: (success) {
      print(success);
      _countryInfo.value = success!;
      changeCountryInfoLoadingStatus(false);
    }, error: (error) {
      changeCountryInfoLoadingStatus(false);
    });
  }

  Future<bool> fetchLongWeekendListByYear(int year) async {
    changeLongWeekendLoadingStatus(true);
    final result = await fetchLongWeekendListByYearUseCase(year: year, countryCode: _selectedCountry.value.countryCode!);

    return result.when(success: (success) {
      _longWeekendList.clear();
      print(success);
      _longWeekendList.addAll(success!);
      changeLongWeekendLoadingStatus(false);
      return true;
    }, error: (error) {
      changeLongWeekendLoadingStatus(false);
      return false;
    });
  }

  @override
  void onInit() async {
    _yearController.value.addListener(() {
      _isBlankYearText.value = _yearController.value.text.trim().isEmpty;
    });
    fetchLibraryVersion();
    await fetchAvailabelCountries();

    super.onInit();
  }
}
