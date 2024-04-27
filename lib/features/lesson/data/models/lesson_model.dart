import 'package:mobile_app_test/features/lesson/domain/entity/lesson_entity.dart';

class LessonModel extends LessonsEntity {
  const LessonModel(
      {required super.id,
      required super.title,
      required super.description,
      required super.video,
      required super.sessionId,
      required super.createdAt,
      required super.updatedAt,
      required super.videoUrl});

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      video: json['video'],
      sessionId: json['sessionId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      videoUrl: json['videoUrl'],
    );
  }
}
