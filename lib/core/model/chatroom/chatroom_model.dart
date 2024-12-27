import 'package:freezed_annotation/freezed_annotation.dart';

part 'chatroom_model.freezed.dart';
part 'chatroom_model.g.dart';

@freezed
class ChatroomModel with _$ChatroomModel {
  const ChatroomModel._();
  const factory ChatroomModel({
    required String roomId,
    required String name,
    required String description,
    required String createdBy,
    required int lastMessageAt,
    required int createdAt,
    required int updatedAt,
    required List<String> usersUid,
    @Default(null) String? imageUrl,
  }) = _ChatroomModel;

  factory ChatroomModel.fromJson(Map<String, dynamic> json) =>
      _$ChatroomModelFromJson(json);
}
