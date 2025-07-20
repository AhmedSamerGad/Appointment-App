// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_users_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RateUsersState {
  List<ReviewingEvtity> get ratings => throw _privateConstructorUsedError;

  /// Create a copy of RateUsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RateUsersStateCopyWith<RateUsersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateUsersStateCopyWith<$Res> {
  factory $RateUsersStateCopyWith(
    RateUsersState value,
    $Res Function(RateUsersState) then,
  ) = _$RateUsersStateCopyWithImpl<$Res, RateUsersState>;
  @useResult
  $Res call({List<ReviewingEvtity> ratings});
}

/// @nodoc
class _$RateUsersStateCopyWithImpl<$Res, $Val extends RateUsersState>
    implements $RateUsersStateCopyWith<$Res> {
  _$RateUsersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RateUsersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? ratings = null}) {
    return _then(
      _value.copyWith(
            ratings:
                null == ratings
                    ? _value.ratings
                    : ratings // ignore: cast_nullable_to_non_nullable
                        as List<ReviewingEvtity>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RateUsersStateImplCopyWith<$Res>
    implements $RateUsersStateCopyWith<$Res> {
  factory _$$RateUsersStateImplCopyWith(
    _$RateUsersStateImpl value,
    $Res Function(_$RateUsersStateImpl) then,
  ) = __$$RateUsersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ReviewingEvtity> ratings});
}

/// @nodoc
class __$$RateUsersStateImplCopyWithImpl<$Res>
    extends _$RateUsersStateCopyWithImpl<$Res, _$RateUsersStateImpl>
    implements _$$RateUsersStateImplCopyWith<$Res> {
  __$$RateUsersStateImplCopyWithImpl(
    _$RateUsersStateImpl _value,
    $Res Function(_$RateUsersStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RateUsersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? ratings = null}) {
    return _then(
      _$RateUsersStateImpl(
        ratings:
            null == ratings
                ? _value._ratings
                : ratings // ignore: cast_nullable_to_non_nullable
                    as List<ReviewingEvtity>,
      ),
    );
  }
}

/// @nodoc

class _$RateUsersStateImpl implements _RateUsersState {
  const _$RateUsersStateImpl({required final List<ReviewingEvtity> ratings})
    : _ratings = ratings;

  final List<ReviewingEvtity> _ratings;
  @override
  List<ReviewingEvtity> get ratings {
    if (_ratings is EqualUnmodifiableListView) return _ratings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ratings);
  }

  @override
  String toString() {
    return 'RateUsersState(ratings: $ratings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RateUsersStateImpl &&
            const DeepCollectionEquality().equals(other._ratings, _ratings));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_ratings));

  /// Create a copy of RateUsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RateUsersStateImplCopyWith<_$RateUsersStateImpl> get copyWith =>
      __$$RateUsersStateImplCopyWithImpl<_$RateUsersStateImpl>(
        this,
        _$identity,
      );
}

abstract class _RateUsersState implements RateUsersState {
  const factory _RateUsersState({
    required final List<ReviewingEvtity> ratings,
  }) = _$RateUsersStateImpl;

  @override
  List<ReviewingEvtity> get ratings;

  /// Create a copy of RateUsersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RateUsersStateImplCopyWith<_$RateUsersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
