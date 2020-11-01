import 'dart:convert';

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.username,
  });

  final String id;
  final String name;
  final String username;

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        username: json["username"] == null ? null : json["username"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "username": username == null ? null : username,
      };

  static List<UserModel> fromJsonList(List list) {
    if (list == null) return null;
    return list.map<UserModel>((item) => UserModel.fromJson(item)).toList();
  }
}
