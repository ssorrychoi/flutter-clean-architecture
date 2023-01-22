import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required int count,
  }) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) => _$HomeStateFromJson(json);
}
