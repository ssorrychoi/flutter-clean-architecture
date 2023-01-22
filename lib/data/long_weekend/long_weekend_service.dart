import 'package:practice_clean_architecture/data/core/api_result.dart';
import 'package:practice_clean_architecture/domain/model/long_weekend/long_weekend_v3_dto.dart';

abstract class LongWeekendService {
  Future<ApiResult<List<LongWeekendV3Dto>>> fetchLongWeekendsListByYear({required int year, required String countryCode});
}
