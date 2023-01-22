import 'package:practice_clean_architecture/data/core/api_result.dart';
import 'package:practice_clean_architecture/data/version/version_service.dart';
import 'package:practice_clean_architecture/domain/model/version/version_info_dto.dart';

class FetchLibraryVersionUseCase {
  VersionService versionService;

  FetchLibraryVersionUseCase({required this.versionService});

  Future<ApiResult<VersionInfoDto>> call() async {
    final result = await versionService.getVersion();

    return result.when(success: (success) {
      return ApiResult.success(data: success);
    }, error: (error) {
      return ApiResult.error(error);
    });
  }
}
