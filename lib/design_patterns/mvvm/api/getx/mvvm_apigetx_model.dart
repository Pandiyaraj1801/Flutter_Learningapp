class MvvmApiGetxModel {
  int userId;
  int id;
  String title;
  bool completed;

  MvvmApiGetxModel([
    this.userId = 0,
    this.id = 0,
    this.title = "",
    this.completed = false,
  ]);

  factory MvvmApiGetxModel.fromJson(Map<String, dynamic> json) {
    return MvvmApiGetxModel(
      json["userId"],
      json["id"],
      json["title"],
      json["completed"],
    );
  }
}
