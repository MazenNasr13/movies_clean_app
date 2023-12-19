import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_app/dependency_injection.dart' as di;
import 'package:movies_clean_app/features/movies/presentation/bloc/movies_bloc/movies_event.dart';

import '../../bloc/movies_bloc/movies_bloc.dart';
import '../../bloc/movies_bloc/movies_state.dart';
import 'loading_widget.dart';
import 'movie_item.dart';

class MoviesListWidget extends StatelessWidget {
  final bool isShowingNow;
  MoviesListWidget({required this.isShowingNow, super.key});

//   @override
//   State<MoviesListWidget> createState() => _MoviesListWidgetState();
// }

// class _MoviesListWidgetState extends State<MoviesListWidget> {
  // final _scrollController = ScrollController();

  // final _moviesBloc = di.sl<MoviesBloc>();

  // final _moviesBloc = MoviesBloc(getAllMovies: );
  // @override
  // void initState() {
  //   super.initState();
  //   _scrollController.addListener(onScroll);
  // }

  // @override
  // void dispose() {
  //   _scrollController
  //     ..removeListener(onScroll)
  //     ..dispose();
  //   super.dispose();
  // }

  // void onScroll() {
  //   final currentScroll = _scrollController.offset;
  //   final maxScroll = _scrollController.position.maxScrollExtent;
  //   if (currentScroll >= (maxScroll * 0.8)) {
  //     // context.read<ShowingMoviesBloc>().add(GetShowingNowEvent());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesBloc>(
      create: (_) => di.getIt<MoviesBloc>()..add(GetAllMoviesEvent(isShowingNow: isShowingNow)),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          switch (state.status) {
            case MovieStatus.error:
              return _buildErrorText(state);
            case MovieStatus.loading:
              return const LoadingWidget();

            case MovieStatus.success:
              if (state.movies.isEmpty) return _buildEmptyWidget();

              return _buildList(state);

            default:
              return Container();
          }
        },
      ),
    );
  }

  Expanded _buildList(MoviesState state) {
    return Expanded(
      child: ListView.builder(
        // controller: _scrollController,
        itemCount: state.movies.length,
        itemBuilder: (context, index) {
          return MovieItem(movie: state.movies[index]);
        },
      ),
    );
  }

  Center _buildEmptyWidget() {
    return const Center(
      child: Text('no movies available'),
    );
  }

  Center _buildErrorText(MoviesState state) {
    return Center(
      child: Text(state.errorMessage),
    );
  }
}
