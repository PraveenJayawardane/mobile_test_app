import 'package:equatable/equatable.dart';
import 'package:mobile_app_test/features/lesson/domain/entity/lesson_entity.dart';

class SessionsEntity extends Equatable {
  final String? id;
  final String? title;
  final String? instructor;
  final String? category;
  final String? image;
  final String? createdAt;
  final String? updatedAt;
  final String? imageUrl;
  final List<LessonsEntity> lesson;
  const SessionsEntity(
      {required this.id,
      required this.title,
      required this.instructor,
      required this.category,
      required this.image,
      required this.createdAt,
      required this.updatedAt,
      required this.imageUrl,
      required this.lesson});

  @override
  List<Object?> get props => [
        id,
        title,
        instructor,
        category,
        image,
        createdAt,
        updatedAt,
        imageUrl,
        lesson
      ];
}
