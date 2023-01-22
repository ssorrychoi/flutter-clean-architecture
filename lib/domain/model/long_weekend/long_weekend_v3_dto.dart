import 'package:freezed_annotation/freezed_annotation.dart';

part 'long_weekend_v3_dto.freezed.dart';
part 'long_weekend_v3_dto.g.dart';

@freezed
class LongWeekendV3Dto with _$LongWeekendV3Dto {
  factory LongWeekendV3Dto({
    String? startDate,
    String? endDate,
    int? dayCount,
    bool? needBridgeDay,
  }) = _LongWeekendV3Dto;

  factory LongWeekendV3Dto.fromJson(Map<String, dynamic> json) => _$LongWeekendV3DtoFromJson(json);
}
