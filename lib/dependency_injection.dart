import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:movies_clean_app/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:movies_clean_app/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:movies_clean_app/features/movies/domain/repositories/movie_repository.dart';
import 'package:movies_clean_app/features/movies/domain/use_cases/get_all_movies.dart';
import 'package:movies_clean_app/features/movies/presentation/bloc/movies_bloc/movies_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
// Features - movies

// Bloc
  getIt.registerFactory(() => MoviesBloc(getAllMovies: getIt()));
// Usecases
  getIt.registerLazySingleton(() => GetAllMoviesUseCase(getIt()));
// Repository
  getIt.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(remoteDataSource: getIt()));
//DataSources
  getIt.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(client: getIt()));
// Core

// External
  getIt.registerLazySingleton(() => http.Client());
}
