import 'dart:convert';

List<UserAccount> userAccountFromJson(String str) => List<UserAccount>.from(
    json.decode(str).map((x) => UserAccount.fromJson(x)));

String userAccountToJson(List<UserAccount> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserAccount {
  UserAccount({
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.password,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  String name;
  String email;
  dynamic emailVerifiedAt;
  String password;
  DateTime createdAt;
  DateTime updatedAt;
  int id;

  factory UserAccount.fromJson(Map<String, dynamic> json) => UserAccount(
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        emailVerifiedAt: json["email_verified_at"],
        password: json["password"] == null ? null : json["password"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "email_verified_at": emailVerifiedAt,
        "password": password == null ? null : password,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "id": id == null ? null : id,
      };
}
