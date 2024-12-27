// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatroom_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatroomModelImpl _$$ChatroomModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatroomModelImpl(
      roomId: json['roomId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      createdBy: json['createdBy'] as String,
      lastMessageAt: (json['lastMessageAt'] as num).toInt(),
      createdAt: (json['createdAt'] as num).toInt(),
      updatedAt: (json['updatedAt'] as num).toInt(),
      usersUid:
          (json['usersUid'] as List<dynamic>).map((e) => e as String).toList(),
      imageUrl: json['imageUrl'] as String? ?? null,
    );

Map<String, dynamic> _$$ChatroomModelImplToJson(_$ChatroomModelImpl instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'name': instance.name,
      'description': instance.description,
      'createdBy': instance.createdBy,
      'lastMessageAt': instance.lastMessageAt,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'usersUid': instance.usersUid,
      'imageUrl': instance.imageUrl,
    };
