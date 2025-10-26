class MvvmApiModel {
  Map<String, dynamic> response = {};
  int userId;
  int id;
  String title;
  bool completed;

  MvvmApiModel([
    this.userId = 0,
    this.id = 0,
    this.title = "",
    this.completed = false,
  ]);

  factory MvvmApiModel.fromJson(Map<String, dynamic> json) {
    return MvvmApiModel(
      json["userId"],
      json["id"],
      json["title"],
      json["completed"],
    );
  }
}
