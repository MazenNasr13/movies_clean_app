import 'package:dartz/dartz.dart';
import 'package:movies_clean_app/features/movies/domain/repositories/movie_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie_entity.dart';

class GetAllMoviesUseCase {
  final MovieRepository repo;

  const GetAllMoviesUseCase(this.repo);

  Future<Either<Failure, List<MovieEntity>>> call(bool isShowingNow) async {
    return await repo.getAllMovies(isShowingNow);
  }
}
