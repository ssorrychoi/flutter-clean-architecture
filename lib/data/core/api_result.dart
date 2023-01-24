import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';

@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success({T? data}) = Success;
  const factory ApiResult.error(DioError error) = Error;
}

const baseUrl = 'https://date.nager.at';
