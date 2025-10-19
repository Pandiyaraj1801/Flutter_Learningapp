import 'dart:convert';

List<UserDetails> userDetailsFromJson(String str) => List<UserDetails>.from(
  json.decode(str).map((x) => UserDetails.fromJson(x)),
);

String userDetailsToJson(List<UserDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDetails {
  int userId;
  int id;
  String title;
  bool completed;

  UserDetails({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
