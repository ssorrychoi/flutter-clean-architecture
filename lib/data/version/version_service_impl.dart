import 'package:dio/dio.dart';
import 'package:practice_clean_architecture/data/core/api_result.dart';
import 'package:practice_clean_architecture/data/version/version_service.dart';
import 'package:practice_clean_architecture/domain/model/version/version_info_dto.dart';

class VersionServiceImpl implements VersionService {
  final dio = Dio();

  @override
  Future<ApiResult<VersionInfoDto>> getVersion() async {
    try {
      final result = await dio.get('$baseUrl/api/v3/Version');

      return ApiResult.success(data: VersionInfoDto.fromJson(result.data));
    } on DioError catch (e) {
      return ApiResult.error(e);
    }
  }
}
