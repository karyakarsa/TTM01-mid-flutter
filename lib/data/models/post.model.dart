import 'package:equatable/equatable.dart';
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';

class PostModel extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String? body;

  const PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  /// Converts the object to a json serializable map.
  ///
  /// This is typically used when sending the object to a server or storing it in a database.
  ///
  /// The resulting map has the following structure:
  ///
  ///
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  /// Converts the model to an entity.
  ///
  /// This is typically used when displaying the object in a user interface or when
  /// performing calculations on the object.
  ///
  /// The resulting entity has the same properties as the model, but is not
  /// serializable to JSON.
  Post toEntity() => Post(userId: userId, id: id, title: title, body: body);

  @override
  List<Object?> get props => [userId, id, title, body];
}
