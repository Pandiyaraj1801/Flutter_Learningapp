import 'package:learnapp/design_patterns/clean_architecture/api/features/domain/entity/api_entity.dart';

class ApiCleanArchModels extends ApiCleanArchEntity {
  ApiCleanArchModels(super.userId, super.id, super.title, super.completed);

  factory ApiCleanArchModels.fromJson(Map<String, dynamic> json) {
    return ApiCleanArchModels(
      json["userId"],
      json["id"],
      json["title"],
      json["completed"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"userId": userId, "id": id, "title": title, "completed": completed};
  }
}
