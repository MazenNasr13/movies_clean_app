import 'package:dartz/dartz.dart';
import 'package:movies_clean_app/core/error/exception.dart';
import 'package:movies_clean_app/core/error/failure.dart';
import 'package:movies_clean_app/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:movies_clean_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movies_clean_app/features/movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<MovieEntity>>> getAllMovies(bool isShowingNow) async {
    try {
      final movies = await remoteDataSource.getAllMovies(isShowingNow: isShowingNow);
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
