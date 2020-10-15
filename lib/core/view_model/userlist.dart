// To parse this JSON data, do
//
//     final userList = userListFromJson(jsonString);

import 'dart:convert';

List<UserList> userListFromJson(String str) => List<UserList>.from(json.decode(str).map((x) => UserList.fromJson(x)));

String userListToJson(List<UserList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserList {
    UserList({
        this.id,
        this.email,
        this.firstName,
        this.lastName,
        this.avatar,
    });

    int id;
    String email;
    String firstName;
    String lastName;
    String avatar;

    factory UserList.fromJson(Map<String, dynamic> json) => UserList(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        avatar: json["avatar"] == null ? null : json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "avatar": avatar == null ? null : avatar,
    };
}

var user = List<UserList>();