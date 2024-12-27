// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get publicKey => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;
  int get lastSeenAt => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  String? get dpUrl => throw _privateConstructorUsedError;
  List<String> get chatsIds => throw _privateConstructorUsedError;
  List<String> get groupsIds => throw _privateConstructorUsedError;
  List<String> get blockedUsersUid => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  bool get isPrivate => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String uid,
      String name,
      String username,
      String email,
      String publicKey,
      int createdAt,
      int updatedAt,
      int lastSeenAt,
      String bio,
      String? dpUrl,
      List<String> chatsIds,
      List<String> groupsIds,
      List<String> blockedUsersUid,
      bool isActive,
      bool isPrivate});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? username = null,
    Object? email = null,
    Object? publicKey = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? lastSeenAt = null,
    Object? bio = null,
    Object? dpUrl = freezed,
    Object? chatsIds = null,
    Object? groupsIds = null,
    Object? blockedUsersUid = null,
    Object? isActive = null,
    Object? isPrivate = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      publicKey: null == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      lastSeenAt: null == lastSeenAt
          ? _value.lastSeenAt
          : lastSeenAt // ignore: cast_nullable_to_non_nullable
              as int,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      dpUrl: freezed == dpUrl
          ? _value.dpUrl
          : dpUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      chatsIds: null == chatsIds
          ? _value.chatsIds
          : chatsIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupsIds: null == groupsIds
          ? _value.groupsIds
          : groupsIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      blockedUsersUid: null == blockedUsersUid
          ? _value.blockedUsersUid
          : blockedUsersUid // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String name,
      String username,
      String email,
      String publicKey,
      int createdAt,
      int updatedAt,
      int lastSeenAt,
      String bio,
      String? dpUrl,
      List<String> chatsIds,
      List<String> groupsIds,
      List<String> blockedUsersUid,
      bool isActive,
      bool isPrivate});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? username = null,
    Object? email = null,
    Object? publicKey = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? lastSeenAt = null,
    Object? bio = null,
    Object? dpUrl = freezed,
    Object? chatsIds = null,
    Object? groupsIds = null,
    Object? blockedUsersUid = null,
    Object? isActive = null,
    Object? isPrivate = null,
  }) {
    return _then(_$UserModelImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      publicKey: null == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      lastSeenAt: null == lastSeenAt
          ? _value.lastSeenAt
          : lastSeenAt // ignore: cast_nullable_to_non_nullable
              as int,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      dpUrl: freezed == dpUrl
          ? _value.dpUrl
          : dpUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      chatsIds: null == chatsIds
          ? _value._chatsIds
          : chatsIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupsIds: null == groupsIds
          ? _value._groupsIds
          : groupsIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      blockedUsersUid: null == blockedUsersUid
          ? _value._blockedUsersUid
          : blockedUsersUid // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl(
      {required this.uid,
      required this.name,
      required this.username,
      required this.email,
      required this.publicKey,
      required this.createdAt,
      required this.updatedAt,
      required this.lastSeenAt,
      this.bio = "Hey there, I'm using PrivacyChat!",
      this.dpUrl = null,
      final List<String> chatsIds = const [],
      final List<String> groupsIds = const [],
      final List<String> blockedUsersUid = const [],
      this.isActive = false,
      this.isPrivate = false})
      : _chatsIds = chatsIds,
        _groupsIds = groupsIds,
        _blockedUsersUid = blockedUsersUid,
        super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String username;
  @override
  final String email;
  @override
  final String publicKey;
  @override
  final int createdAt;
  @override
  final int updatedAt;
  @override
  final int lastSeenAt;
  @override
  @JsonKey()
  final String bio;
  @override
  @JsonKey()
  final String? dpUrl;
  final List<String> _chatsIds;
  @override
  @JsonKey()
  List<String> get chatsIds {
    if (_chatsIds is EqualUnmodifiableListView) return _chatsIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatsIds);
  }

  final List<String> _groupsIds;
  @override
  @JsonKey()
  List<String> get groupsIds {
    if (_groupsIds is EqualUnmodifiableListView) return _groupsIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groupsIds);
  }

  final List<String> _blockedUsersUid;
  @override
  @JsonKey()
  List<String> get blockedUsersUid {
    if (_blockedUsersUid is EqualUnmodifiableListView) return _blockedUsersUid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blockedUsersUid);
  }

  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final bool isPrivate;

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, username: $username, email: $email, publicKey: $publicKey, createdAt: $createdAt, updatedAt: $updatedAt, lastSeenAt: $lastSeenAt, bio: $bio, dpUrl: $dpUrl, chatsIds: $chatsIds, groupsIds: $groupsIds, blockedUsersUid: $blockedUsersUid, isActive: $isActive, isPrivate: $isPrivate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.publicKey, publicKey) ||
                other.publicKey == publicKey) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.lastSeenAt, lastSeenAt) ||
                other.lastSeenAt == lastSeenAt) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.dpUrl, dpUrl) || other.dpUrl == dpUrl) &&
            const DeepCollectionEquality().equals(other._chatsIds, _chatsIds) &&
            const DeepCollectionEquality()
                .equals(other._groupsIds, _groupsIds) &&
            const DeepCollectionEquality()
                .equals(other._blockedUsersUid, _blockedUsersUid) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      name,
      username,
      email,
      publicKey,
      createdAt,
      updatedAt,
      lastSeenAt,
      bio,
      dpUrl,
      const DeepCollectionEquality().hash(_chatsIds),
      const DeepCollectionEquality().hash(_groupsIds),
      const DeepCollectionEquality().hash(_blockedUsersUid),
      isActive,
      isPrivate);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {required final String uid,
      required final String name,
      required final String username,
      required final String email,
      required final String publicKey,
      required final int createdAt,
      required final int updatedAt,
      required final int lastSeenAt,
      final String bio,
      final String? dpUrl,
      final List<String> chatsIds,
      final List<String> groupsIds,
      final List<String> blockedUsersUid,
      final bool isActive,
      final bool isPrivate}) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  String get username;
  @override
  String get email;
  @override
  String get publicKey;
  @override
  int get createdAt;
  @override
  int get updatedAt;
  @override
  int get lastSeenAt;
  @override
  String get bio;
  @override
  String? get dpUrl;
  @override
  List<String> get chatsIds;
  @override
  List<String> get groupsIds;
  @override
  List<String> get blockedUsersUid;
  @override
  bool get isActive;
  @override
  bool get isPrivate;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
