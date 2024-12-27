import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();
  const factory UserModel({
    required String uid,
    required String name,
    required String username,
    required String email,
    required String publicKey,
    required int createdAt,
    required int updatedAt,
    required int lastSeenAt,
    @Default("Hey there, I'm using PrivacyChat!") String bio,
    @Default(null) String? dpUrl,
    @Default([]) List<String> chatsIds,
    @Default([]) List<String> groupsIds,
    @Default([]) List<String> blockedUsersUid,
    @Default(false) bool isActive,
    @Default(false) bool isPrivate,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
