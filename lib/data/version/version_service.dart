import 'package:practice_clean_architecture/data/core/api_result.dart';
import 'package:practice_clean_architecture/domain/model/version/version_info_dto.dart';

abstract class VersionService {
  Future<ApiResult<VersionInfoDto>> getVersion();
}
