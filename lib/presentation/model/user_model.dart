// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String? status;
  final String? message;
  final Data? data;

  UserModel({
    this.status,
    this.message,
    this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? phone;
  final String? avatar;
  final int? earnings;
  final String? role;
  final String? status;
  final String? isVerified;
  final DateTime? joinedAt;
  final String? ratings;
  final String? bio;

  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.avatar,
    this.earnings,
    this.role,
    this.status,
    this.isVerified,
    this.joinedAt,
    this.ratings,
    this.bio,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        gender: json["gender"],
        phone: json["phone"],
        avatar: json["avatar"],
        earnings: json["earnings"],
        role: json["role"],
        status: json["status"],
        isVerified: json["is_verified"],
        joinedAt: json["joined_at"] == null
            ? null
            : DateTime.parse(json["joined_at"]),
        ratings: json["ratings"],
        bio: json["bio"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "gender": gender,
        "phone": phone,
        "avatar": avatar,
        "earnings": earnings,
        "role": role,
        "status": status,
        "is_verified": isVerified,
        "joined_at": joinedAt?.toIso8601String(),
        "ratings": ratings,
        "bio": bio,
      };
}
