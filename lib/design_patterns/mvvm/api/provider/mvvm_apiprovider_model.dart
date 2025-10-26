class MvvmApiProviderModel {
  Map<String, dynamic> response = {};
  int userId;
  int id;
  String title;
  bool completed;

  MvvmApiProviderModel([
    this.userId = 0,
    this.id = 0,
    this.title = "",
    this.completed = false,
  ]);

  factory MvvmApiProviderModel.fromJson(Map<String, dynamic> json) {
    return MvvmApiProviderModel(
      json["userId"],
      json["id"],
      json["title"],
      json["completed"],
    );
  }
}
