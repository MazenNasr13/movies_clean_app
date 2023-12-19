import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_app/core/strings/failures.dart';
import 'package:movies_clean_app/features/movies/domain/use_cases/get_all_movies.dart';
import 'package:movies_clean_app/features/movies/presentation/bloc/movies_bloc/movies_event.dart';
import 'package:movies_clean_app/features/movies/presentation/bloc/movies_bloc/movies_state.dart';

import '../../../../../core/error/failure.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetAllMoviesUseCase getAllMovies;
  MoviesBloc({required this.getAllMovies}) : super(const MoviesState()) {
    on<GetAllMoviesEvent>(_getAllMovies);
  }

  Future<void> _getAllMovies(GetAllMoviesEvent event, Emitter<MoviesState> emit) async {
    emit(state.copyWith(status: MovieStatus.loading));

    final failureOrMovies = await getAllMovies.call(event.isShowingNow);
    emit(
      failureOrMovies.fold(
        (failure) => state.copyWith(status: MovieStatus.error, errorMessage: _mapFailureToMessage(failure)),
        (movies) => state.copyWith(status: MovieStatus.success, movies: movies),
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
