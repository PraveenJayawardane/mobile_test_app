import 'package:equatable/equatable.dart';

class LessonsEntity extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final String? video;
  final String? sessionId;
  final String? createdAt;
  final String? updatedAt;
  final String? videoUrl;

  const LessonsEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.video,
    required this.sessionId,
    required this.createdAt,
    required this.updatedAt,
    required this.videoUrl,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        sessionId,
        video,
        createdAt,
        updatedAt,
        videoUrl,
      ];
}
