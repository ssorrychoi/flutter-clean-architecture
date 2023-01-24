import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';
import 'package:practice_clean_architecture/data/core/api_result.dart';

class FetchlibraryVersionUseCase {
  final VersionApi versionApi;

  FetchlibraryVersionUseCase({required this.versionApi});

  Future<ApiResult<VersionInfoDto>> call() async {
    try {
      print('FETCHING VERSION INFO...');
      final result = await versionApi.versionGetVersion();

      print(result.data);

      return ApiResult.success(data: result.data);
    } on DioError catch (e) {
      return ApiResult.error(e);
    }
  }
}
