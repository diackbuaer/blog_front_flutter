// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel? postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel? data) => json.encode(data!.toJson());

class PostModel {
    PostModel({
        this.id,
        this.userId,
        this.body,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.liked,
        this.user,
    });

    int? id;
    int? userId;
    String? body;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    bool? liked;
    User? user;

    factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["id"],
        userId: json["user_id"],
        body: json["body"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        liked: json["liked"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "body": body,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "liked": liked,
        "user": user!.toJson(),
    };
}

class User {
    User({
        this.id,
        this.name,
        this.email,
        this.username,
        this.emailVerifiedAt,
        this.twoFactorConfirmedAt,
        this.currentTeamId,
        this.profilePhotoPath,
        this.createdAt,
        this.updatedAt,
        this.profilePhotoUrl,
    });

    int? id;
    String? name;
    String? email;
    String? username;
    dynamic emailVerifiedAt;
    dynamic twoFactorConfirmedAt;
    dynamic currentTeamId;
    dynamic profilePhotoPath;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? profilePhotoUrl;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
        emailVerifiedAt: json["email_verified_at"],
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
        currentTeamId: json["current_team_id"],
        profilePhotoPath: json["profile_photo_path"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        profilePhotoUrl: json["profile_photo_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "username": username,
        "email_verified_at": emailVerifiedAt,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "current_team_id": currentTeamId,
        "profile_photo_path": profilePhotoPath,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "profile_photo_url": profilePhotoUrl,
    };
}
