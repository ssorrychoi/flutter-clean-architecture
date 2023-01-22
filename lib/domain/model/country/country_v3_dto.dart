import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_v3_dto.freezed.dart';
part 'country_v3_dto.g.dart';

@freezed
class CountryV3Dto with _$CountryV3Dto {
  factory CountryV3Dto({
    String? countryCode,
    String? name,
  }) = _CountryV3Dto;

  factory CountryV3Dto.fromJson(Map<String, dynamic> json) => _$CountryV3DtoFromJson(json);
}
