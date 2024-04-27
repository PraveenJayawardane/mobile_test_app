import 'package:mobile_app_test/features/lesson/domain/entity/session_entity.dart';

import 'lesson_model.dart';

class SessionModel extends SessionsEntity {
  const SessionModel(
      {required super.id,
      required super.title,
      required super.instructor,
      required super.category,
      required super.image,
      required super.createdAt,
      required super.updatedAt,
      required super.imageUrl,
      required super.lesson});

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
        id: json['id'],
        title: json['title'],
        instructor: json['instructor'],
        category: json['category'],
        image: json['image'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        imageUrl: json['imageUrl'],
        lesson: json['lessons'] != []
            ? (json['lessons'] as List<dynamic>)
                .map((lessons) => LessonModel.fromJson(lessons))
                .toList()
            : []);
  }
}
