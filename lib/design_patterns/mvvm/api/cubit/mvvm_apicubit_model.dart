class MvvmApiCubitModel {
  int userId;
  int id;
  String title;
  bool completed;

  MvvmApiCubitModel(this.userId, this.id, this.title, this.completed);

  factory MvvmApiCubitModel.fromJson(Map<String, dynamic> json) {
    return MvvmApiCubitModel(
      json["userId"],
      json["id"],
      json["title"],
      json["completed"],
    );
  }
}
