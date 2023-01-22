import 'package:practice_clean_architecture/data/core/api_result.dart';
import 'package:practice_clean_architecture/data/long_weekend/long_weekend_service.dart';
import 'package:practice_clean_architecture/domain/model/long_weekend/long_weekend_v3_dto.dart';

class FetchLongWeekendListByYearUseCase {
  LongWeekendService longWeekendService;

  FetchLongWeekendListByYearUseCase({required this.longWeekendService});

  Future<ApiResult<List<LongWeekendV3Dto>>> call({required int year, required String countryCode}) async {
    final result = await longWeekendService.fetchLongWeekendsListByYear(year: year, countryCode: countryCode);

    return result.when(success: (success) {
      return ApiResult.success(data: success);
    }, error: (error) {
      return ApiResult.error(error);
    });
  }
}
