// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      uid: json['uid'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      publicKey: json['publicKey'] as String,
      createdAt: (json['createdAt'] as num).toInt(),
      updatedAt: (json['updatedAt'] as num).toInt(),
      lastSeenAt: (json['lastSeenAt'] as num).toInt(),
      bio: json['bio'] as String? ?? "Hey there, I'm using PrivacyChat!",
      dpUrl: json['dpUrl'] as String? ?? null,
      chatsIds: (json['chatsIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      groupsIds: (json['groupsIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      blockedUsersUid: (json['blockedUsersUid'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isActive: json['isActive'] as bool? ?? false,
      isPrivate: json['isPrivate'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'publicKey': instance.publicKey,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'lastSeenAt': instance.lastSeenAt,
      'bio': instance.bio,
      'dpUrl': instance.dpUrl,
      'chatsIds': instance.chatsIds,
      'groupsIds': instance.groupsIds,
      'blockedUsersUid': instance.blockedUsersUid,
      'isActive': instance.isActive,
      'isPrivate': instance.isPrivate,
    };
