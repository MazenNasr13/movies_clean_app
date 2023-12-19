import 'package:equatable/equatable.dart';
import 'package:movies_clean_app/features/movies/domain/entities/movie_entity.dart';

enum MovieStatus { init, loading, success, error }

class MoviesState extends Equatable {
  final MovieStatus status;
  final List<MovieEntity> movies;
  final String errorMessage;

  const MoviesState({
    this.status = MovieStatus.loading,
    this.movies = const [],
    this.errorMessage = '',
  });

  MoviesState copyWith({
    MovieStatus? status,
    List<MovieEntity>? movies,
    String? errorMessage,
  }) {
    return MoviesState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, movies, errorMessage];
}
