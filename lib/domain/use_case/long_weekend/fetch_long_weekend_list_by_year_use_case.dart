import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';
import 'package:practice_clean_architecture/data/core/api_result.dart';

class FetchLongWeekendListByYearUseCase {
  final LongWeekendApi longWeekendApi;

  FetchLongWeekendListByYearUseCase({required this.longWeekendApi});

  Future<ApiResult<BuiltList<LongWeekendV3Dto>>> call({required int year, required String countryCode}) async {
    try {
      final result = await longWeekendApi.longWeekendLongWeekend(year: year, countryCode: countryCode);

      return ApiResult.success(data: result.data);
    } on DioError catch (e) {
      return ApiResult.error(e);
    }
  }
}
