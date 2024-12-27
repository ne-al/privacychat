// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatroom_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatroomModel _$ChatroomModelFromJson(Map<String, dynamic> json) {
  return _ChatroomModel.fromJson(json);
}

/// @nodoc
mixin _$ChatroomModel {
  String get roomId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  int get lastMessageAt => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;
  List<String> get usersUid => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this ChatroomModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatroomModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatroomModelCopyWith<ChatroomModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatroomModelCopyWith<$Res> {
  factory $ChatroomModelCopyWith(
          ChatroomModel value, $Res Function(ChatroomModel) then) =
      _$ChatroomModelCopyWithImpl<$Res, ChatroomModel>;
  @useResult
  $Res call(
      {String roomId,
      String name,
      String description,
      String createdBy,
      int lastMessageAt,
      int createdAt,
      int updatedAt,
      List<String> usersUid,
      String? imageUrl});
}

/// @nodoc
class _$ChatroomModelCopyWithImpl<$Res, $Val extends ChatroomModel>
    implements $ChatroomModelCopyWith<$Res> {
  _$ChatroomModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatroomModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? name = null,
    Object? description = null,
    Object? createdBy = null,
    Object? lastMessageAt = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? usersUid = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessageAt: null == lastMessageAt
          ? _value.lastMessageAt
          : lastMessageAt // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      usersUid: null == usersUid
          ? _value.usersUid
          : usersUid // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatroomModelImplCopyWith<$Res>
    implements $ChatroomModelCopyWith<$Res> {
  factory _$$ChatroomModelImplCopyWith(
          _$ChatroomModelImpl value, $Res Function(_$ChatroomModelImpl) then) =
      __$$ChatroomModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String roomId,
      String name,
      String description,
      String createdBy,
      int lastMessageAt,
      int createdAt,
      int updatedAt,
      List<String> usersUid,
      String? imageUrl});
}

/// @nodoc
class __$$ChatroomModelImplCopyWithImpl<$Res>
    extends _$ChatroomModelCopyWithImpl<$Res, _$ChatroomModelImpl>
    implements _$$ChatroomModelImplCopyWith<$Res> {
  __$$ChatroomModelImplCopyWithImpl(
      _$ChatroomModelImpl _value, $Res Function(_$ChatroomModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatroomModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? name = null,
    Object? description = null,
    Object? createdBy = null,
    Object? lastMessageAt = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? usersUid = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$ChatroomModelImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessageAt: null == lastMessageAt
          ? _value.lastMessageAt
          : lastMessageAt // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      usersUid: null == usersUid
          ? _value._usersUid
          : usersUid // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatroomModelImpl extends _ChatroomModel {
  const _$ChatroomModelImpl(
      {required this.roomId,
      required this.name,
      required this.description,
      required this.createdBy,
      required this.lastMessageAt,
      required this.createdAt,
      required this.updatedAt,
      required final List<String> usersUid,
      this.imageUrl = null})
      : _usersUid = usersUid,
        super._();

  factory _$ChatroomModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatroomModelImplFromJson(json);

  @override
  final String roomId;
  @override
  final String name;
  @override
  final String description;
  @override
  final String createdBy;
  @override
  final int lastMessageAt;
  @override
  final int createdAt;
  @override
  final int updatedAt;
  final List<String> _usersUid;
  @override
  List<String> get usersUid {
    if (_usersUid is EqualUnmodifiableListView) return _usersUid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usersUid);
  }

  @override
  @JsonKey()
  final String? imageUrl;

  @override
  String toString() {
    return 'ChatroomModel(roomId: $roomId, name: $name, description: $description, createdBy: $createdBy, lastMessageAt: $lastMessageAt, createdAt: $createdAt, updatedAt: $updatedAt, usersUid: $usersUid, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatroomModelImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.lastMessageAt, lastMessageAt) ||
                other.lastMessageAt == lastMessageAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._usersUid, _usersUid) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      roomId,
      name,
      description,
      createdBy,
      lastMessageAt,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_usersUid),
      imageUrl);

  /// Create a copy of ChatroomModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatroomModelImplCopyWith<_$ChatroomModelImpl> get copyWith =>
      __$$ChatroomModelImplCopyWithImpl<_$ChatroomModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatroomModelImplToJson(
      this,
    );
  }
}

abstract class _ChatroomModel extends ChatroomModel {
  const factory _ChatroomModel(
      {required final String roomId,
      required final String name,
      required final String description,
      required final String createdBy,
      required final int lastMessageAt,
      required final int createdAt,
      required final int updatedAt,
      required final List<String> usersUid,
      final String? imageUrl}) = _$ChatroomModelImpl;
  const _ChatroomModel._() : super._();

  factory _ChatroomModel.fromJson(Map<String, dynamic> json) =
      _$ChatroomModelImpl.fromJson;

  @override
  String get roomId;
  @override
  String get name;
  @override
  String get description;
  @override
  String get createdBy;
  @override
  int get lastMessageAt;
  @override
  int get createdAt;
  @override
  int get updatedAt;
  @override
  List<String> get usersUid;
  @override
  String? get imageUrl;

  /// Create a copy of ChatroomModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatroomModelImplCopyWith<_$ChatroomModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
