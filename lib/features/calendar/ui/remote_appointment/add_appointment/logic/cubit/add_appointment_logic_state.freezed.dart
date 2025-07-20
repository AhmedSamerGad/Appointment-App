// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_appointment_logic_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AddAppointmentLogicState {
  Set<String> get selectedGroupIds => throw _privateConstructorUsedError;
  Set<String> get selectedUserIds => throw _privateConstructorUsedError;
  List<ReviewingEvtity> get reviews => throw _privateConstructorUsedError;

  /// Create a copy of AddAppointmentLogicState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddAppointmentLogicStateCopyWith<AddAppointmentLogicState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddAppointmentLogicStateCopyWith<$Res> {
  factory $AddAppointmentLogicStateCopyWith(
    AddAppointmentLogicState value,
    $Res Function(AddAppointmentLogicState) then,
  ) = _$AddAppointmentLogicStateCopyWithImpl<$Res, AddAppointmentLogicState>;
  @useResult
  $Res call({
    Set<String> selectedGroupIds,
    Set<String> selectedUserIds,
    List<ReviewingEvtity> reviews,
  });
}

/// @nodoc
class _$AddAppointmentLogicStateCopyWithImpl<
  $Res,
  $Val extends AddAppointmentLogicState
>
    implements $AddAppointmentLogicStateCopyWith<$Res> {
  _$AddAppointmentLogicStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddAppointmentLogicState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedGroupIds = null,
    Object? selectedUserIds = null,
    Object? reviews = null,
  }) {
    return _then(
      _value.copyWith(
            selectedGroupIds:
                null == selectedGroupIds
                    ? _value.selectedGroupIds
                    : selectedGroupIds // ignore: cast_nullable_to_non_nullable
                        as Set<String>,
            selectedUserIds:
                null == selectedUserIds
                    ? _value.selectedUserIds
                    : selectedUserIds // ignore: cast_nullable_to_non_nullable
                        as Set<String>,
            reviews:
                null == reviews
                    ? _value.reviews
                    : reviews // ignore: cast_nullable_to_non_nullable
                        as List<ReviewingEvtity>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AddAppointmentLogicStateImplCopyWith<$Res>
    implements $AddAppointmentLogicStateCopyWith<$Res> {
  factory _$$AddAppointmentLogicStateImplCopyWith(
    _$AddAppointmentLogicStateImpl value,
    $Res Function(_$AddAppointmentLogicStateImpl) then,
  ) = __$$AddAppointmentLogicStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Set<String> selectedGroupIds,
    Set<String> selectedUserIds,
    List<ReviewingEvtity> reviews,
  });
}

/// @nodoc
class __$$AddAppointmentLogicStateImplCopyWithImpl<$Res>
    extends
        _$AddAppointmentLogicStateCopyWithImpl<
          $Res,
          _$AddAppointmentLogicStateImpl
        >
    implements _$$AddAppointmentLogicStateImplCopyWith<$Res> {
  __$$AddAppointmentLogicStateImplCopyWithImpl(
    _$AddAppointmentLogicStateImpl _value,
    $Res Function(_$AddAppointmentLogicStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddAppointmentLogicState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedGroupIds = null,
    Object? selectedUserIds = null,
    Object? reviews = null,
  }) {
    return _then(
      _$AddAppointmentLogicStateImpl(
        selectedGroupIds:
            null == selectedGroupIds
                ? _value._selectedGroupIds
                : selectedGroupIds // ignore: cast_nullable_to_non_nullable
                    as Set<String>,
        selectedUserIds:
            null == selectedUserIds
                ? _value._selectedUserIds
                : selectedUserIds // ignore: cast_nullable_to_non_nullable
                    as Set<String>,
        reviews:
            null == reviews
                ? _value._reviews
                : reviews // ignore: cast_nullable_to_non_nullable
                    as List<ReviewingEvtity>,
      ),
    );
  }
}

/// @nodoc

class _$AddAppointmentLogicStateImpl implements _AddAppointmentLogicState {
  const _$AddAppointmentLogicStateImpl({
    final Set<String> selectedGroupIds = const {},
    final Set<String> selectedUserIds = const {},
    final List<ReviewingEvtity> reviews = const [],
  }) : _selectedGroupIds = selectedGroupIds,
       _selectedUserIds = selectedUserIds,
       _reviews = reviews;

  final Set<String> _selectedGroupIds;
  @override
  @JsonKey()
  Set<String> get selectedGroupIds {
    if (_selectedGroupIds is EqualUnmodifiableSetView) return _selectedGroupIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedGroupIds);
  }

  final Set<String> _selectedUserIds;
  @override
  @JsonKey()
  Set<String> get selectedUserIds {
    if (_selectedUserIds is EqualUnmodifiableSetView) return _selectedUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedUserIds);
  }

  final List<ReviewingEvtity> _reviews;
  @override
  @JsonKey()
  List<ReviewingEvtity> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  String toString() {
    return 'AddAppointmentLogicState(selectedGroupIds: $selectedGroupIds, selectedUserIds: $selectedUserIds, reviews: $reviews)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAppointmentLogicStateImpl &&
            const DeepCollectionEquality().equals(
              other._selectedGroupIds,
              _selectedGroupIds,
            ) &&
            const DeepCollectionEquality().equals(
              other._selectedUserIds,
              _selectedUserIds,
            ) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_selectedGroupIds),
    const DeepCollectionEquality().hash(_selectedUserIds),
    const DeepCollectionEquality().hash(_reviews),
  );

  /// Create a copy of AddAppointmentLogicState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAppointmentLogicStateImplCopyWith<_$AddAppointmentLogicStateImpl>
  get copyWith => __$$AddAppointmentLogicStateImplCopyWithImpl<
    _$AddAppointmentLogicStateImpl
  >(this, _$identity);
}

abstract class _AddAppointmentLogicState implements AddAppointmentLogicState {
  const factory _AddAppointmentLogicState({
    final Set<String> selectedGroupIds,
    final Set<String> selectedUserIds,
    final List<ReviewingEvtity> reviews,
  }) = _$AddAppointmentLogicStateImpl;

  @override
  Set<String> get selectedGroupIds;
  @override
  Set<String> get selectedUserIds;
  @override
  List<ReviewingEvtity> get reviews;

  /// Create a copy of AddAppointmentLogicState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddAppointmentLogicStateImplCopyWith<_$AddAppointmentLogicStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
