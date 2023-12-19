import 'package:movies_clean_app/features/movies/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.id,
    required super.title,
    required super.imageUrl,
    required super.releaseDate,
    required super.synopsis,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['poster_path'],
      releaseDate: json['release_date'],
      synopsis: json['overview'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'poster_path': imageUrl,
      'release_date': releaseDate,
      'overviw': synopsis,
    };
  }
}
