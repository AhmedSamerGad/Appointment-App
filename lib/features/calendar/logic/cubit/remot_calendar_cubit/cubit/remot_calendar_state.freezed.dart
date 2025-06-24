// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remot_calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RemotCalendarState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() remoteLoading,
    required TResult Function(T data) remoteSuccess,
    required TResult Function(String error) remoteError,
    required TResult Function(
      List<AppointmentEntitiy> days,
      DateTime selectedDay,
    )
    remoteDayChange,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? remoteLoading,
    TResult? Function(T data)? remoteSuccess,
    TResult? Function(String error)? remoteError,
    TResult? Function(List<AppointmentEntitiy> days, DateTime selectedDay)?
    remoteDayChange,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? remoteLoading,
    TResult Function(T data)? remoteSuccess,
    TResult Function(String error)? remoteError,
    TResult Function(List<AppointmentEntitiy> days, DateTime selectedDay)?
    remoteDayChange,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(remote_Loading<T> value) remoteLoading,
    required TResult Function(remote_Success<T> value) remoteSuccess,
    required TResult Function(remote_Error<T> value) remoteError,
    required TResult Function(remote_Change<T> value) remoteDayChange,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(remote_Loading<T> value)? remoteLoading,
    TResult? Function(remote_Success<T> value)? remoteSuccess,
    TResult? Function(remote_Error<T> value)? remoteError,
    TResult? Function(remote_Change<T> value)? remoteDayChange,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(remote_Loading<T> value)? remoteLoading,
    TResult Function(remote_Success<T> value)? remoteSuccess,
    TResult Function(remote_Error<T> value)? remoteError,
    TResult Function(remote_Change<T> value)? remoteDayChange,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemotCalendarStateCopyWith<T, $Res> {
  factory $RemotCalendarStateCopyWith(
    RemotCalendarState<T> value,
    $Res Function(RemotCalendarState<T>) then,
  ) = _$RemotCalendarStateCopyWithImpl<T, $Res, RemotCalendarState<T>>;
}

/// @nodoc
class _$RemotCalendarStateCopyWithImpl<
  T,
  $Res,
  $Val extends RemotCalendarState<T>
>
    implements $RemotCalendarStateCopyWith<T, $Res> {
  _$RemotCalendarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemotCalendarState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$remote_LoadingImplCopyWith<T, $Res> {
  factory _$$remote_LoadingImplCopyWith(
    _$remote_LoadingImpl<T> value,
    $Res Function(_$remote_LoadingImpl<T>) then,
  ) = __$$remote_LoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$remote_LoadingImplCopyWithImpl<T, $Res>
    extends _$RemotCalendarStateCopyWithImpl<T, $Res, _$remote_LoadingImpl<T>>
    implements _$$remote_LoadingImplCopyWith<T, $Res> {
  __$$remote_LoadingImplCopyWithImpl(
    _$remote_LoadingImpl<T> _value,
    $Res Function(_$remote_LoadingImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of RemotCalendarState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$remote_LoadingImpl<T> implements remote_Loading<T> {
  const _$remote_LoadingImpl();

  @override
  String toString() {
    return 'RemotCalendarState<$T>.remoteLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$remote_LoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() remoteLoading,
    required TResult Function(T data) remoteSuccess,
    required TResult Function(String error) remoteError,
    required TResult Function(
      List<AppointmentEntitiy> days,
      DateTime selectedDay,
    )
    remoteDayChange,
  }) {
    return remoteLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? remoteLoading,
    TResult? Function(T data)? remoteSuccess,
    TResult? Function(String error)? remoteError,
    TResult? Function(List<AppointmentEntitiy> days, DateTime selectedDay)?
    remoteDayChange,
  }) {
    return remoteLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? remoteLoading,
    TResult Function(T data)? remoteSuccess,
    TResult Function(String error)? remoteError,
    TResult Function(List<AppointmentEntitiy> days, DateTime selectedDay)?
    remoteDayChange,
    required TResult orElse(),
  }) {
    if (remoteLoading != null) {
      return remoteLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(remote_Loading<T> value) remoteLoading,
    required TResult Function(remote_Success<T> value) remoteSuccess,
    required TResult Function(remote_Error<T> value) remoteError,
    required TResult Function(remote_Change<T> value) remoteDayChange,
  }) {
    return remoteLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(remote_Loading<T> value)? remoteLoading,
    TResult? Function(remote_Success<T> value)? remoteSuccess,
    TResult? Function(remote_Error<T> value)? remoteError,
    TResult? Function(remote_Change<T> value)? remoteDayChange,
  }) {
    return remoteLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(remote_Loading<T> value)? remoteLoading,
    TResult Function(remote_Success<T> value)? remoteSuccess,
    TResult Function(remote_Error<T> value)? remoteError,
    TResult Function(remote_Change<T> value)? remoteDayChange,
    required TResult orElse(),
  }) {
    if (remoteLoading != null) {
      return remoteLoading(this);
    }
    return orElse();
  }
}

abstract class remote_Loading<T> implements RemotCalendarState<T> {
  const factory remote_Loading() = _$remote_LoadingImpl<T>;
}

/// @nodoc
abstract class _$$remote_SuccessImplCopyWith<T, $Res> {
  factory _$$remote_SuccessImplCopyWith(
    _$remote_SuccessImpl<T> value,
    $Res Function(_$remote_SuccessImpl<T>) then,
  ) = __$$remote_SuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$remote_SuccessImplCopyWithImpl<T, $Res>
    extends _$RemotCalendarStateCopyWithImpl<T, $Res, _$remote_SuccessImpl<T>>
    implements _$$remote_SuccessImplCopyWith<T, $Res> {
  __$$remote_SuccessImplCopyWithImpl(
    _$remote_SuccessImpl<T> _value,
    $Res Function(_$remote_SuccessImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of RemotCalendarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed}) {
    return _then(
      _$remote_SuccessImpl<T>(
        freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                as T,
      ),
    );
  }
}

/// @nodoc

class _$remote_SuccessImpl<T> implements remote_Success<T> {
  const _$remote_SuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'RemotCalendarState<$T>.remoteSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$remote_SuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of RemotCalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$remote_SuccessImplCopyWith<T, _$remote_SuccessImpl<T>> get copyWith =>
      __$$remote_SuccessImplCopyWithImpl<T, _$remote_SuccessImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() remoteLoading,
    required TResult Function(T data) remoteSuccess,
    required TResult Function(String error) remoteError,
    required TResult Function(
      List<AppointmentEntitiy> days,
      DateTime selectedDay,
    )
    remoteDayChange,
  }) {
    return remoteSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? remoteLoading,
    TResult? Function(T data)? remoteSuccess,
    TResult? Function(String error)? remoteError,
    TResult? Function(List<AppointmentEntitiy> days, DateTime selectedDay)?
    remoteDayChange,
  }) {
    return remoteSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? remoteLoading,
    TResult Function(T data)? remoteSuccess,
    TResult Function(String error)? remoteError,
    TResult Function(List<AppointmentEntitiy> days, DateTime selectedDay)?
    remoteDayChange,
    required TResult orElse(),
  }) {
    if (remoteSuccess != null) {
      return remoteSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(remote_Loading<T> value) remoteLoading,
    required TResult Function(remote_Success<T> value) remoteSuccess,
    required TResult Function(remote_Error<T> value) remoteError,
    required TResult Function(remote_Change<T> value) remoteDayChange,
  }) {
    return remoteSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(remote_Loading<T> value)? remoteLoading,
    TResult? Function(remote_Success<T> value)? remoteSuccess,
    TResult? Function(remote_Error<T> value)? remoteError,
    TResult? Function(remote_Change<T> value)? remoteDayChange,
  }) {
    return remoteSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(remote_Loading<T> value)? remoteLoading,
    TResult Function(remote_Success<T> value)? remoteSuccess,
    TResult Function(remote_Error<T> value)? remoteError,
    TResult Function(remote_Change<T> value)? remoteDayChange,
    required TResult orElse(),
  }) {
    if (remoteSuccess != null) {
      return remoteSuccess(this);
    }
    return orElse();
  }
}

abstract class remote_Success<T> implements RemotCalendarState<T> {
  const factory remote_Success(final T data) = _$remote_SuccessImpl<T>;

  T get data;

  /// Create a copy of RemotCalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$remote_SuccessImplCopyWith<T, _$remote_SuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$remote_ErrorImplCopyWith<T, $Res> {
  factory _$$remote_ErrorImplCopyWith(
    _$remote_ErrorImpl<T> value,
    $Res Function(_$remote_ErrorImpl<T>) then,
  ) = __$$remote_ErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$remote_ErrorImplCopyWithImpl<T, $Res>
    extends _$RemotCalendarStateCopyWithImpl<T, $Res, _$remote_ErrorImpl<T>>
    implements _$$remote_ErrorImplCopyWith<T, $Res> {
  __$$remote_ErrorImplCopyWithImpl(
    _$remote_ErrorImpl<T> _value,
    $Res Function(_$remote_ErrorImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of RemotCalendarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$remote_ErrorImpl<T>(
        null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$remote_ErrorImpl<T> implements remote_Error<T> {
  const _$remote_ErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'RemotCalendarState<$T>.remoteError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$remote_ErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of RemotCalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$remote_ErrorImplCopyWith<T, _$remote_ErrorImpl<T>> get copyWith =>
      __$$remote_ErrorImplCopyWithImpl<T, _$remote_ErrorImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() remoteLoading,
    required TResult Function(T data) remoteSuccess,
    required TResult Function(String error) remoteError,
    required TResult Function(
      List<AppointmentEntitiy> days,
      DateTime selectedDay,
    )
    remoteDayChange,
  }) {
    return remoteError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? remoteLoading,
    TResult? Function(T data)? remoteSuccess,
    TResult? Function(String error)? remoteError,
    TResult? Function(List<AppointmentEntitiy> days, DateTime selectedDay)?
    remoteDayChange,
  }) {
    return remoteError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? remoteLoading,
    TResult Function(T data)? remoteSuccess,
    TResult Function(String error)? remoteError,
    TResult Function(List<AppointmentEntitiy> days, DateTime selectedDay)?
    remoteDayChange,
    required TResult orElse(),
  }) {
    if (remoteError != null) {
      return remoteError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(remote_Loading<T> value) remoteLoading,
    required TResult Function(remote_Success<T> value) remoteSuccess,
    required TResult Function(remote_Error<T> value) remoteError,
    required TResult Function(remote_Change<T> value) remoteDayChange,
  }) {
    return remoteError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(remote_Loading<T> value)? remoteLoading,
    TResult? Function(remote_Success<T> value)? remoteSuccess,
    TResult? Function(remote_Error<T> value)? remoteError,
    TResult? Function(remote_Change<T> value)? remoteDayChange,
  }) {
    return remoteError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(remote_Loading<T> value)? remoteLoading,
    TResult Function(remote_Success<T> value)? remoteSuccess,
    TResult Function(remote_Error<T> value)? remoteError,
    TResult Function(remote_Change<T> value)? remoteDayChange,
    required TResult orElse(),
  }) {
    if (remoteError != null) {
      return remoteError(this);
    }
    return orElse();
  }
}

abstract class remote_Error<T> implements RemotCalendarState<T> {
  const factory remote_Error(final String error) = _$remote_ErrorImpl<T>;

  String get error;

  /// Create a copy of RemotCalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$remote_ErrorImplCopyWith<T, _$remote_ErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$remote_ChangeImplCopyWith<T, $Res> {
  factory _$$remote_ChangeImplCopyWith(
    _$remote_ChangeImpl<T> value,
    $Res Function(_$remote_ChangeImpl<T>) then,
  ) = __$$remote_ChangeImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<AppointmentEntitiy> days, DateTime selectedDay});
}

/// @nodoc
class __$$remote_ChangeImplCopyWithImpl<T, $Res>
    extends _$RemotCalendarStateCopyWithImpl<T, $Res, _$remote_ChangeImpl<T>>
    implements _$$remote_ChangeImplCopyWith<T, $Res> {
  __$$remote_ChangeImplCopyWithImpl(
    _$remote_ChangeImpl<T> _value,
    $Res Function(_$remote_ChangeImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of RemotCalendarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? days = null, Object? selectedDay = null}) {
    return _then(
      _$remote_ChangeImpl<T>(
        null == days
            ? _value._days
            : days // ignore: cast_nullable_to_non_nullable
                as List<AppointmentEntitiy>,
        null == selectedDay
            ? _value.selectedDay
            : selectedDay // ignore: cast_nullable_to_non_nullable
                as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$remote_ChangeImpl<T> implements remote_Change<T> {
  const _$remote_ChangeImpl(
    final List<AppointmentEntitiy> days,
    this.selectedDay,
  ) : _days = days;

  final List<AppointmentEntitiy> _days;
  @override
  List<AppointmentEntitiy> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  final DateTime selectedDay;

  @override
  String toString() {
    return 'RemotCalendarState<$T>.remoteDayChange(days: $days, selectedDay: $selectedDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$remote_ChangeImpl<T> &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_days),
    selectedDay,
  );

  /// Create a copy of RemotCalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$remote_ChangeImplCopyWith<T, _$remote_ChangeImpl<T>> get copyWith =>
      __$$remote_ChangeImplCopyWithImpl<T, _$remote_ChangeImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() remoteLoading,
    required TResult Function(T data) remoteSuccess,
    required TResult Function(String error) remoteError,
    required TResult Function(
      List<AppointmentEntitiy> days,
      DateTime selectedDay,
    )
    remoteDayChange,
  }) {
    return remoteDayChange(days, selectedDay);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? remoteLoading,
    TResult? Function(T data)? remoteSuccess,
    TResult? Function(String error)? remoteError,
    TResult? Function(List<AppointmentEntitiy> days, DateTime selectedDay)?
    remoteDayChange,
  }) {
    return remoteDayChange?.call(days, selectedDay);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? remoteLoading,
    TResult Function(T data)? remoteSuccess,
    TResult Function(String error)? remoteError,
    TResult Function(List<AppointmentEntitiy> days, DateTime selectedDay)?
    remoteDayChange,
    required TResult orElse(),
  }) {
    if (remoteDayChange != null) {
      return remoteDayChange(days, selectedDay);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(remote_Loading<T> value) remoteLoading,
    required TResult Function(remote_Success<T> value) remoteSuccess,
    required TResult Function(remote_Error<T> value) remoteError,
    required TResult Function(remote_Change<T> value) remoteDayChange,
  }) {
    return remoteDayChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(remote_Loading<T> value)? remoteLoading,
    TResult? Function(remote_Success<T> value)? remoteSuccess,
    TResult? Function(remote_Error<T> value)? remoteError,
    TResult? Function(remote_Change<T> value)? remoteDayChange,
  }) {
    return remoteDayChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(remote_Loading<T> value)? remoteLoading,
    TResult Function(remote_Success<T> value)? remoteSuccess,
    TResult Function(remote_Error<T> value)? remoteError,
    TResult Function(remote_Change<T> value)? remoteDayChange,
    required TResult orElse(),
  }) {
    if (remoteDayChange != null) {
      return remoteDayChange(this);
    }
    return orElse();
  }
}

abstract class remote_Change<T> implements RemotCalendarState<T> {
  const factory remote_Change(
    final List<AppointmentEntitiy> days,
    final DateTime selectedDay,
  ) = _$remote_ChangeImpl<T>;

  List<AppointmentEntitiy> get days;
  DateTime get selectedDay;

  /// Create a copy of RemotCalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$remote_ChangeImplCopyWith<T, _$remote_ChangeImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
