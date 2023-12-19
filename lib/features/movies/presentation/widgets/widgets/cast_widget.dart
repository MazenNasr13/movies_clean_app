// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// class MovieCastWidget extends StatelessWidget {
//   MovieCastWidget({
//     super.key,
//     required this.movieId,
//   });

//   final int movieId;

//   final _actorsBloc = ActorsBloc();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => _actorsBloc..add(ActorsEventfetch(movieId)),
//       child: Column(
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(top: 8),
//             child: Text(
//               'Cast',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//           ),
//           BlocBuilder<ActorsBloc, ActorsState>(
//             builder: (context, state) {
//               if (state.status == ActorsStatus.success) return _buildCastList(state.actors);
//               if (state.status == ActorsStatus.loading) return const CircularProgressIndicator();
//               if (state.status == ActorsStatus.error) return Text(state.errorMessage);
//               return Container();
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCastList(List<Actor> actors) {
//     return SizedBox(
//       child: CarouselSlider.builder(
//         options: CarouselOptions(aspectRatio: 1 / 1, height: 200),
//         itemCount: actors.length,
//         itemBuilder: (context, index, realIndex) {
//           return Card(
//             margin: const EdgeInsets.all(10),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             clipBehavior: Clip.hardEdge,
//             elevation: 40,
//             child: Image(
//               image: NetworkImage(
//                 Constants().imagePath + (actors[index].actorImage ?? ''),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
