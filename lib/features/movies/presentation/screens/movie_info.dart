import 'package:flutter/material.dart';
import 'package:movies_clean_app/features/movies/domain/entities/movie_entity.dart';

import '../../../../core/constants.dart';
// import '../widgets/widgets/cast_widget.dart';

class MovieInfoScreen extends StatelessWidget {
  const MovieInfoScreen({super.key, required this.movie});

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              _buildStack(),
              _buildSynopsis(),
              // MovieCastWidget(movieId: movie.id),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildSynopsis() {
    return SizedBox(
      width: double.infinity,
      height: 180,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          children: [
            const Text(
              'Synopsis',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              movie.synopsis,
            ),
          ],
        ),
      ),
    );
  }

  Container _buildStack() {
    return Container(
      width: double.infinity,
      height: 400,
      child: Stack(
        children: [
          Hero(
            tag: movie.title,
            child: Image(
              image: NetworkImage('${Constants().imagePath}${movie.imageUrl}'),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              height: 450,
              width: double.infinity,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share),
                style: const ButtonStyle(
                  iconSize: MaterialStatePropertyAll(28),
                  iconColor: MaterialStatePropertyAll(Colors.white),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.star),
                style: const ButtonStyle(
                  iconSize: MaterialStatePropertyAll(28),
                  iconColor: MaterialStatePropertyAll(Colors.white),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: Column(
              children: [
                Text(
                  movie.title,
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis, // it cuts the text by three dots ...
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Text(
                  movie.releaseDate,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
              // ),
              // ],
            ),
          ),
        ],
      ),
    );
  }
}
