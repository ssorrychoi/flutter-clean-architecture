import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_info_dto.freezed.dart';
part 'country_info_dto.g.dart';

@freezed
class CountryInfoDto with _$CountryInfoDto {
  factory CountryInfoDto({
    String? commonName,
    String? officialName,
    String? countryCode,
    String? region,
    List<CommonCountryInfo>? borders,
  }) = _CountryInfoDto;

  factory CountryInfoDto.fromJson(Map<String, dynamic> json) => _$CountryInfoDtoFromJson(json);
}

@freezed
class CommonCountryInfo with _$CommonCountryInfo {
  factory CommonCountryInfo({
    String? commonName,
    String? officialName,
    String? countryCode,
    String? region,
  }) = _CommonCountryInfo;
  factory CommonCountryInfo.fromJson(Map<String, dynamic> json) => _$CommonCountryInfoFromJson(json);
}
