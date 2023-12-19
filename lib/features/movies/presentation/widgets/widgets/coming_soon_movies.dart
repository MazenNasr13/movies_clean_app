// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movies_app/bloc/coming_soon_movies_bloc.dart';
// import 'package:movies_app/bloc/coming_soon_movies_states.dart';
// import 'package:movies_app/bloc/movies1_events.dart';
// import 'package:movies_app/widgets/loading_widget.dart';
// import 'package:movies_app/widgets/movie_item.dart';

// class ComingSoonMoviesList extends StatefulWidget {
//   const ComingSoonMoviesList({super.key});

//   @override
//   State<ComingSoonMoviesList> createState() => _ComingSoonMoviesListState();
// }

// class _ComingSoonMoviesListState extends State<ComingSoonMoviesList> {
//   final _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(onScroll);
//   }

//   @override
//   void dispose() {
//     _scrollController
//       ..removeListener(onScroll)
//       ..dispose();
//     super.dispose();
//   }

//   void onScroll() {
//     final currentScroll = _scrollController.offset;
//     final maxScroll = _scrollController.position.maxScrollExtent;
//     if (currentScroll >= (maxScroll * 0.8)) {
//       context.read<ComingSoonMoviesBloc>().add(GetComingSoonEvent());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ComingSoonMoviesBloc, ComingSoonMoviesStates>(
//       builder: (context, state) {
//         switch (state.status) {
//           case MovieStatus.error:
//             return Center(
//               child: Text(state.errorMessage),
//             );
//           case MovieStatus.loading:
//             return const LoadingWidget();

//           case MovieStatus.success:
//             if (state.movies.isEmpty) {
//               return const Center(
//                 child: Text('no movies available'),
//               );
//             }
//             return Expanded(
//               child: ListView.builder(
//                 controller: _scrollController,
//                 itemCount: state.movies.length,
//                 itemBuilder: (context, index) {
//                   return MovieItem(movie: state.movies[index]);
//                 },
//               ),
//             );
//         }
//       },
//     );
//   }
// }
