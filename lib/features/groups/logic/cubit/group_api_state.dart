import 'package:freezed_annotation/freezed_annotation.dart';

part  'group_api_state.freezed.dart';

@freezed
class GroupApiState with _$GroupApiState {
  const factory GroupApiState.initial() = _Initial;
  const factory GroupApiState.loading() = _Loading;
  const factory GroupApiState.loaded(dynamic data) = _Loaded;
  const factory GroupApiState.error(String message) = _Error;
}
