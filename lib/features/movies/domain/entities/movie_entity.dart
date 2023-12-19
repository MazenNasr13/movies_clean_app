import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String title;
  final String imageUrl;
  final String synopsis;
  final String releaseDate;
  final int id;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.releaseDate,
    required this.synopsis,
  });

  @override
  List<Object?> get props => [id, title, imageUrl, releaseDate, synopsis];
}
