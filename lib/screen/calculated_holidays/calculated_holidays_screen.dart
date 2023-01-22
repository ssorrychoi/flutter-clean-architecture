import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_clean_architecture/domain/model/country/country_v3_dto.dart';
import 'package:practice_clean_architecture/screen/calculated_holidays/calculated_holidays_screen_view_model.dart';

class DateCountriesScreen extends StatefulWidget {
  const DateCountriesScreen({super.key});

  @override
  State<DateCountriesScreen> createState() => _DateCountriesScreenState();
}

class _DateCountriesScreenState extends State<DateCountriesScreen> {
  final screenViewModel = Get.find<CalculatedHolidaysScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('나라별 공휴일 계산기'),
      ),
      body: SafeArea(
          child: Obx(
        () => screenViewModel.isFetchingLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: GestureDetector(
                  onTap: () {
                    screenViewModel.toggleKeyboard();
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Obx(
                          () => Row(
                            children: [
                              Text(screenViewModel.versionInfo.name),
                              const Spacer(),
                              Text(
                                screenViewModel.versionInfo.version,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  const Text('국가 선택'),
                                  const Spacer(),
                                  Obx(
                                    () => DropdownButton(
                                      items: screenViewModel.countryList.map<DropdownMenuItem<CountryV3Dto>>((CountryV3Dto value) {
                                        return DropdownMenuItem<CountryV3Dto>(
                                          value: value,
                                          child: Text('${value.countryCode}' + '(' + value.name! + ')'),
                                        );
                                      }).toList(),
                                      onChanged: (value) async {
                                        screenViewModel.selectCountry(value as CountryV3Dto);
                                      },
                                      value: screenViewModel.selectedCountry,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Text('국가 정보'),
                                  const Spacer(),
                                  Obx(
                                    () => screenViewModel.isCountryInfoLoading
                                        ? const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('CountryCode: ' + screenViewModel.selectedCountry.countryCode),
                                              const SizedBox(height: 4),
                                              Text('Name: ' + screenViewModel.selectedCountry.name),
                                              const SizedBox(height: 4),
                                              Text('CommonName: ' + screenViewModel.countryInfo.commonName),
                                              const SizedBox(height: 4),
                                              Text('OfficialName: ' + screenViewModel.countryInfo.officialName),
                                              const SizedBox(height: 4),
                                              Text('Region: ' + screenViewModel.countryInfo.region),
                                            ],
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Text('조회 연도'),
                                  SizedBox(width: 20),
                                  Expanded(
                                      child: Obx(
                                    () => TextField(
                                      controller: screenViewModel.yearController,
                                      keyboardType: TextInputType.number,
                                      focusNode: screenViewModel.yearFocusNode,
                                      decoration: InputDecoration(
                                          hintText: '조회 연도를 입력하세요',
                                          suffix: Obx(
                                            () => InkWell(
                                              borderRadius: BorderRadius.circular(8),
                                              onTap: screenViewModel.isBlankYearText
                                                  ? null
                                                  : () async {
                                                      await screenViewModel
                                                          .fetchLongWeekendListByYear(int.parse(screenViewModel.yearController.text));
                                                    },
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                                                child: Text(
                                                  '조회',
                                                  style: TextStyle(color: screenViewModel.isBlankYearText ? null : Colors.blue),
                                                ),
                                              ),
                                            ),
                                          )),
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            Obx(
                              () => screenViewModel.isLongWeekendLoading
                                  ? Container(
                                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : ListView.separated(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        final longWeekend = screenViewModel.longWeekendList[index];
                                        return Container(
                                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(longWeekend.startDate),
                                                  Text(' ~ '),
                                                  Text(longWeekend.endDate),
                                                ],
                                              ),
                                              if (longWeekend.needBridgeDay)
                                                Text(
                                                  '개인 휴가 따로 필요*',
                                                  style: TextStyle(color: Colors.red),
                                                ),
                                              Text('총 쉬는날 : ${longWeekend.dayCount.toString()}일'),
                                            ],
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return const Divider(height: 0);
                                      },
                                      itemCount: screenViewModel.longWeekendList.length,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      )),
    );
  }
}
