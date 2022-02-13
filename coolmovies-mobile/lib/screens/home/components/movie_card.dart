import 'package:animations/animations.dart' show OpenContainer;
import 'package:flutter/material.dart';
import 'package:coolmovies/models/movies.dart';
import 'package:coolmovies/screens/details/details_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: OpenContainer(
        closedElevation: 0,
        openElevation: 0,
        closedBuilder: (context, action) => buildMovieCard(context),
        openBuilder: (context, action) => DetailsScreen(movie: movie),
      ),
    );
  }

  Column buildMovieCard(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [kDefaultShadow],

              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(movie.imgUrl!),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          child: Text(
            movie.title!,
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontWeight: FontWeight.w800, fontSize: 21),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
