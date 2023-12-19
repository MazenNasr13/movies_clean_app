import 'package:flutter/material.dart';
import 'package:movies_clean_app/features/movies/domain/entities/movie_entity.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../../../core/constants.dart';
import '../../screens/movie_info.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movie});
  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return _buildMovieItem(context);
  }

  Card _buildMovieItem(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 40,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MovieInfoScreen(movie: movie),
            ),
          );
        },
        child: _buildMovieItemStack(context),
      ),
    );
  }

  Stack _buildMovieItemStack(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: movie.title,
          child: FadeInImage(
            image: NetworkImage('${Constants().imagePath}${movie.imageUrl}'),
            placeholder: MemoryImage(kTransparentImage),
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            height: 450,
            width: double.infinity,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.star),
              style: const ButtonStyle(
                iconSize: MaterialStatePropertyAll(28),
                iconColor: MaterialStatePropertyAll(Colors.white),
              ),
            )
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 150,
          child: Column(
            children: [
              Text(
                movie.title,
                maxLines: 2,
                textAlign: TextAlign.center,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Book',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
