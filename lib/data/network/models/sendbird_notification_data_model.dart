class SendbirdNotificationDataModel {
  SendbirdNotificationDataModel({
    required this.recipient,
    required this.unreadMessageCount,
    required this.pushTrackingId,
    required this.type,
    required this.message,
    required this.customType,
    required this.channel,
    required this.channelType,
    required this.appId,
    required this.files,
    required this.translations,
    required this.createdAt,
    required this.messageId,
    required this.category,
    required this.mentionedUsers,
    required this.notificationAction,
    required this.sender,
    required this.sqsTs,
    required this.audienceType,
    required this.pushTitle,
    required this.pushSound,
    required this.sessionKey,
  });

  final Recipient? recipient;
  final int? unreadMessageCount;
  final String? pushTrackingId;
  final String? type;
  final String? message;
  final String? customType;
  final Channel? channel;
  final String? channelType;
  final String? appId;
  final List<dynamic> files;
  final Translations? translations;
  final int? createdAt;
  final int? messageId;
  final String? category;
  final List<dynamic> mentionedUsers;
  final String? notificationAction;
  final Sender? sender;
  final int? sqsTs;
  final String? audienceType;
  final dynamic pushTitle;
  final String? pushSound;
  final SessionKey? sessionKey;

  factory SendbirdNotificationDataModel.fromJson(Map<String, dynamic> json){
    return SendbirdNotificationDataModel(
      recipient: json["recipient"] == null ? null : Recipient.fromJson(json["recipient"]),
      unreadMessageCount: json["unread_message_count"],
      pushTrackingId: json["push_tracking_id"],
      type: json["type"],
      message: json["message"],
      customType: json["custom_type"],
      channel: json["channel"] == null ? null : Channel.fromJson(json["channel"]),
      channelType: json["channel_type"],
      appId: json["app_id"],
      files: json["files"] == null ? [] : List<dynamic>.from(json["files"]!.map((x) => x)),
      translations: json["translations"] == null ? null : Translations.fromJson(json["translations"]),
      createdAt: json["created_at"],
      messageId: json["message_id"],
      category: json["category"],
      mentionedUsers: json["mentioned_users"] == null ? [] : List<dynamic>.from(json["mentioned_users"]!.map((x) => x)),
      notificationAction: json["notification_action"],
      sender: json["sender"] == null ? null : Sender.fromJson(json["sender"]),
      sqsTs: json["sqs_ts"],
      audienceType: json["audience_type"],
      pushTitle: json["push_title"],
      pushSound: json["push_sound"],
      sessionKey: json["session_key"] == null ? null : SessionKey.fromJson(json["session_key"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "recipient": recipient?.toJson(),
    "unread_message_count": unreadMessageCount,
    "push_tracking_id": pushTrackingId,
    "type": type,
    "message": message,
    "custom_type": customType,
    "channel": channel?.toJson(),
    "channel_type": channelType,
    "app_id": appId,
    "files": files.map((x) => x).toList(),
    "translations": translations?.toJson(),
    "created_at": createdAt,
    "message_id": messageId,
    "category": category,
    "mentioned_users": mentionedUsers.map((x) => x).toList(),
    "notification_action": notificationAction,
    "sender": sender?.toJson(),
    "sqs_ts": sqsTs,
    "audience_type": audienceType,
    "push_title": pushTitle,
    "push_sound": pushSound,
    "session_key": sessionKey?.toJson(),
  };

}

class Channel {
  Channel({
    required this.name,
    required this.channelUrl,
    required this.customType,
    required this.channelUnreadMessageCount,
  });

  final String? name;
  final String? channelUrl;
  final String? customType;
  final int? channelUnreadMessageCount;

  factory Channel.fromJson(Map<String, dynamic> json){
    return Channel(
      name: json["name"],
      channelUrl: json["channel_url"],
      customType: json["custom_type"],
      channelUnreadMessageCount: json["channel_unread_message_count"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "channel_url": channelUrl,
    "custom_type": customType,
    "channel_unread_message_count": channelUnreadMessageCount,
  };

}

class Recipient {
  Recipient({
    required this.id,
    required this.name,
    required this.pushTemplate,
  });

  final String? id;
  final String? name;
  final String? pushTemplate;

  factory Recipient.fromJson(Map<String, dynamic> json){
    return Recipient(
      id: json["id"],
      name: json["name"],
      pushTemplate: json["push_template"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "push_template": pushTemplate,
  };

}

class Sender {
  Sender({
    required this.id,
    required this.name,
    required this.profileUrl,
    required this.requireAuthForProfileImage,
  });

  final String? id;
  final String? name;
  final String? profileUrl;
  final bool? requireAuthForProfileImage;

  factory Sender.fromJson(Map<String, dynamic> json){
    return Sender(
      id: json["id"],
      name: json["name"],
      profileUrl: json["profile_url"],
      requireAuthForProfileImage: json["require_auth_for_profile_image"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "profile_url": profileUrl,
    "require_auth_for_profile_image": requireAuthForProfileImage,
  };

}

class SessionKey {
  SessionKey({
    required this.key,
    required this.topics,
  });

  final String? key;
  final List<String> topics;

  factory SessionKey.fromJson(Map<String, dynamic> json){
    return SessionKey(
      key: json["key"],
      topics: json["topics"] == null ? [] : List<String>.from(json["topics"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "key": key,
    "topics": topics.map((x) => x).toList(),
  };

}

class Translations {
  Translations({required this.json});
  final Map<String,dynamic> json;

  factory Translations.fromJson(Map<String, dynamic> json){
    return Translations(
        json: json
    );
  }

  Map<String, dynamic> toJson() => {
  };

}
