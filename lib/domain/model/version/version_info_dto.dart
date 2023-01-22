import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_info_dto.freezed.dart';
part 'version_info_dto.g.dart';

@freezed
class VersionInfoDto with _$VersionInfoDto {
  factory VersionInfoDto({
    String? name,
    String? version,
  }) = _VersionInfoDto;

  factory VersionInfoDto.fromJson(Map<String, dynamic> json) => _$VersionInfoDtoFromJson(json);
}
