import 'package:dartz/dartz.dart';
import 'package:movies_clean_app/core/error/failure.dart';
import 'package:movies_clean_app/features/movies/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getAllMovies(bool isShowingNow);
}
