import 'package:freezed_annotation/freezed_annotation.dart';

part 'public_holiday_v3_dto.freezed.dart';
part 'public_holiday_v3_dto.g.dart';

@freezed
class PublicHolidayV3Dto with _$PublicHolidayV3Dto {
  factory PublicHolidayV3Dto({
    String? date,
    String? localName,
    String? name,
    String? countryCode,
    bool? fixed,
    bool? global,
    List<String>? counties,
    int? launchYear,
    List<String>? types,
  }) = _PublicHolidayV3Dto;

  factory PublicHolidayV3Dto.fromJson(Map<String, dynamic> json) => _$PublicHolidayV3DtoFromJson(json);
}

enum PublicHolidayType {
  public,
  bank,
  school,
  authorities,
  optional,
  observance,
}
