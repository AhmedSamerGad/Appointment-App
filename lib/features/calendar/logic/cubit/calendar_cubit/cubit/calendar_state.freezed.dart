// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CalendarState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime selectedDay, DateTime focusedDay)
    initial,
    required TResult Function(DateTime selectedDay, DateTime focusedDay)
    dayChanged,
    required TResult Function(double value) sliderChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime selectedDay, DateTime focusedDay)? initial,
    TResult? Function(DateTime selectedDay, DateTime focusedDay)? dayChanged,
    TResult? Function(double value)? sliderChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime selectedDay, DateTime focusedDay)? initial,
    TResult Function(DateTime selectedDay, DateTime focusedDay)? dayChanged,
    TResult Function(double value)? sliderChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DayChanged value) dayChanged,
    required TResult Function(_SliderChanged value) sliderChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DayChanged value)? dayChanged,
    TResult? Function(_SliderChanged value)? sliderChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DayChanged value)? dayChanged,
    TResult Function(_SliderChanged value)? sliderChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
    CalendarState value,
    $Res Function(CalendarState) then,
  ) = _$CalendarStateCopyWithImpl<$Res, CalendarState>;
}

/// @nodoc
class _$CalendarStateCopyWithImpl<$Res, $Val extends CalendarState>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime selectedDay, DateTime focusedDay});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? selectedDay = null, Object? focusedDay = null}) {
    return _then(
      _$InitialImpl(
        selectedDay:
            null == selectedDay
                ? _value.selectedDay
                : selectedDay // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        focusedDay:
            null == focusedDay
                ? _value.focusedDay
                : focusedDay // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({required this.selectedDay, required this.focusedDay});

  @override
  final DateTime selectedDay;
  @override
  final DateTime focusedDay;

  @override
  String toString() {
    return 'CalendarState.initial(selectedDay: $selectedDay, focusedDay: $focusedDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            (identical(other.focusedDay, focusedDay) ||
                other.focusedDay == focusedDay));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedDay, focusedDay);

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime selectedDay, DateTime focusedDay)
    initial,
    required TResult Function(DateTime selectedDay, DateTime focusedDay)
    dayChanged,
    required TResult Function(double value) sliderChanged,
  }) {
    return initial(selectedDay, focusedDay);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime selectedDay, DateTime focusedDay)? initial,
    TResult? Function(DateTime selectedDay, DateTime focusedDay)? dayChanged,
    TResult? Function(double value)? sliderChanged,
  }) {
    return initial?.call(selectedDay, focusedDay);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime selectedDay, DateTime focusedDay)? initial,
    TResult Function(DateTime selectedDay, DateTime focusedDay)? dayChanged,
    TResult Function(double value)? sliderChanged,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(selectedDay, focusedDay);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DayChanged value) dayChanged,
    required TResult Function(_SliderChanged value) sliderChanged,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DayChanged value)? dayChanged,
    TResult? Function(_SliderChanged value)? sliderChanged,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DayChanged value)? dayChanged,
    TResult Function(_SliderChanged value)? sliderChanged,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CalendarState {
  const factory _Initial({
    required final DateTime selectedDay,
    required final DateTime focusedDay,
  }) = _$InitialImpl;

  DateTime get selectedDay;
  DateTime get focusedDay;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DayChangedImplCopyWith<$Res> {
  factory _$$DayChangedImplCopyWith(
    _$DayChangedImpl value,
    $Res Function(_$DayChangedImpl) then,
  ) = __$$DayChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime selectedDay, DateTime focusedDay});
}

/// @nodoc
class __$$DayChangedImplCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$DayChangedImpl>
    implements _$$DayChangedImplCopyWith<$Res> {
  __$$DayChangedImplCopyWithImpl(
    _$DayChangedImpl _value,
    $Res Function(_$DayChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? selectedDay = null, Object? focusedDay = null}) {
    return _then(
      _$DayChangedImpl(
        selectedDay:
            null == selectedDay
                ? _value.selectedDay
                : selectedDay // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        focusedDay:
            null == focusedDay
                ? _value.focusedDay
                : focusedDay // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$DayChangedImpl implements _DayChanged {
  const _$DayChangedImpl({required this.selectedDay, required this.focusedDay});

  @override
  final DateTime selectedDay;
  @override
  final DateTime focusedDay;

  @override
  String toString() {
    return 'CalendarState.dayChanged(selectedDay: $selectedDay, focusedDay: $focusedDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayChangedImpl &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            (identical(other.focusedDay, focusedDay) ||
                other.focusedDay == focusedDay));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedDay, focusedDay);

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DayChangedImplCopyWith<_$DayChangedImpl> get copyWith =>
      __$$DayChangedImplCopyWithImpl<_$DayChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime selectedDay, DateTime focusedDay)
    initial,
    required TResult Function(DateTime selectedDay, DateTime focusedDay)
    dayChanged,
    required TResult Function(double value) sliderChanged,
  }) {
    return dayChanged(selectedDay, focusedDay);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime selectedDay, DateTime focusedDay)? initial,
    TResult? Function(DateTime selectedDay, DateTime focusedDay)? dayChanged,
    TResult? Function(double value)? sliderChanged,
  }) {
    return dayChanged?.call(selectedDay, focusedDay);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime selectedDay, DateTime focusedDay)? initial,
    TResult Function(DateTime selectedDay, DateTime focusedDay)? dayChanged,
    TResult Function(double value)? sliderChanged,
    required TResult orElse(),
  }) {
    if (dayChanged != null) {
      return dayChanged(selectedDay, focusedDay);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DayChanged value) dayChanged,
    required TResult Function(_SliderChanged value) sliderChanged,
  }) {
    return dayChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DayChanged value)? dayChanged,
    TResult? Function(_SliderChanged value)? sliderChanged,
  }) {
    return dayChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DayChanged value)? dayChanged,
    TResult Function(_SliderChanged value)? sliderChanged,
    required TResult orElse(),
  }) {
    if (dayChanged != null) {
      return dayChanged(this);
    }
    return orElse();
  }
}

abstract class _DayChanged implements CalendarState {
  const factory _DayChanged({
    required final DateTime selectedDay,
    required final DateTime focusedDay,
  }) = _$DayChangedImpl;

  DateTime get selectedDay;
  DateTime get focusedDay;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DayChangedImplCopyWith<_$DayChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SliderChangedImplCopyWith<$Res> {
  factory _$$SliderChangedImplCopyWith(
    _$SliderChangedImpl value,
    $Res Function(_$SliderChangedImpl) then,
  ) = __$$SliderChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double value});
}

/// @nodoc
class __$$SliderChangedImplCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$SliderChangedImpl>
    implements _$$SliderChangedImplCopyWith<$Res> {
  __$$SliderChangedImplCopyWithImpl(
    _$SliderChangedImpl _value,
    $Res Function(_$SliderChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _$SliderChangedImpl(
        value:
            null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc

class _$SliderChangedImpl implements _SliderChanged {
  const _$SliderChangedImpl({required this.value});

  @override
  final double value;

  @override
  String toString() {
    return 'CalendarState.sliderChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SliderChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SliderChangedImplCopyWith<_$SliderChangedImpl> get copyWith =>
      __$$SliderChangedImplCopyWithImpl<_$SliderChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime selectedDay, DateTime focusedDay)
    initial,
    required TResult Function(DateTime selectedDay, DateTime focusedDay)
    dayChanged,
    required TResult Function(double value) sliderChanged,
  }) {
    return sliderChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime selectedDay, DateTime focusedDay)? initial,
    TResult? Function(DateTime selectedDay, DateTime focusedDay)? dayChanged,
    TResult? Function(double value)? sliderChanged,
  }) {
    return sliderChanged?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime selectedDay, DateTime focusedDay)? initial,
    TResult Function(DateTime selectedDay, DateTime focusedDay)? dayChanged,
    TResult Function(double value)? sliderChanged,
    required TResult orElse(),
  }) {
    if (sliderChanged != null) {
      return sliderChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DayChanged value) dayChanged,
    required TResult Function(_SliderChanged value) sliderChanged,
  }) {
    return sliderChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DayChanged value)? dayChanged,
    TResult? Function(_SliderChanged value)? sliderChanged,
  }) {
    return sliderChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DayChanged value)? dayChanged,
    TResult Function(_SliderChanged value)? sliderChanged,
    required TResult orElse(),
  }) {
    if (sliderChanged != null) {
      return sliderChanged(this);
    }
    return orElse();
  }
}

abstract class _SliderChanged implements CalendarState {
  const factory _SliderChanged({required final double value}) =
      _$SliderChangedImpl;

  double get value;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SliderChangedImplCopyWith<_$SliderChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
