
import 'dart:convert';

class ChatModel {
    final String name;
    final String image;
    final String message;
    final int unreadMessageCount;
    final DateTime date;
    final String id;

    ChatModel({
        required this.name,
        required this.image,
        required this.message,
        required this.unreadMessageCount,
        required this.date,
        required this.id,
    });

    ChatModel copyWith({
        String? name,
        String? image,
        String? message,
        int? unreadMessageCount,
        DateTime? date,
        String? id,
    }) => 
        ChatModel(
            name: name ?? this.name,
            image: image ?? this.image,
            message: message ?? this.message,
            unreadMessageCount: unreadMessageCount ?? this.unreadMessageCount,
            date: date ?? this.date,
            id: id ?? this.id,
        );

    factory ChatModel.fromRawJson(String str) => ChatModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        name: json["name"],
        image: json["image"],
        message: json["message"],
        unreadMessageCount: json["unread_message_count"],
        date: DateTime.parse(json["date"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "message": message,
        "unread_message_count": unreadMessageCount,
        "date": date.toIso8601String(),
        "id": id,
    };
}
