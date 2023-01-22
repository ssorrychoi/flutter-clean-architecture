import 'package:dio/dio.dart';
import 'package:practice_clean_architecture/data/core/api_result.dart';
import 'package:practice_clean_architecture/data/long_weekend/long_weekend_service.dart';
import 'package:practice_clean_architecture/domain/model/long_weekend/long_weekend_v3_dto.dart';

class LongWeekendServiceImpl implements LongWeekendService {
  final dio = Dio();

  @override
  Future<ApiResult<List<LongWeekendV3Dto>>> fetchLongWeekendsListByYear({required int year, required String countryCode}) async {
    try {
      final result = await dio.get(
        '$baseUrl/api/v3/LongWeekend/$year/$countryCode',
      );

      final longWeekendsList = (result.data as List).map((e) => LongWeekendV3Dto.fromJson(e)).toList();

      return ApiResult.success(data: longWeekendsList);
    } on DioError catch (e) {
      return ApiResult.error(e);
    }
  }
}
