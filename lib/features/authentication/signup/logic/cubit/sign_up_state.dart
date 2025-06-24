import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_state.freezed.dart'; // Update this line

@freezed
class SignUpState<T> with _$SignUpState<T> {
  const factory SignUpState.loading() = Loading;
  const factory SignUpState.success(T data) = Success<T>;
  const factory SignUpState.error(String message) = Error;
}
