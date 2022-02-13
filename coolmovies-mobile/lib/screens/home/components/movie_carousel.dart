import 'package:coolmovies/models/movies.dart';
import 'package:coolmovies/services/graphql_service.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../constants.dart';
import 'movie_card.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({Key? key}) : super(key: key);

  @override
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  final ValueNotifier<AllMovies?> _moviesData = ValueNotifier(null);
  PageController? _pageController;
  int initialPage = 0;

  @override
  void initState() {
    super.initState();
    _initPageController();
  }

  void _initPageController() async {
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
  }


  @override
  void dispose() {
    super.dispose();
    _pageController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    fetchMovies(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: ValueListenableBuilder(
          valueListenable: _moviesData,
          builder: (BuildContext context, AllMovies? data, Widget? _) {
            if (data == null) {
              return const CircularProgressIndicator();
            }
            final List<Movie> movies = data.movies!;
            return
              AspectRatio(
                aspectRatio: 0.85,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      initialPage = value;
                    });
                  },
                  controller: _pageController,
                  physics: const ClampingScrollPhysics(),
                  itemCount: movies.length,
                  // we have 3 demo movies
                  itemBuilder: (context, index) => buildMovieSlider(index: index, movie: movies.elementAt(index)),
                ),
              );
          }
      ),
    );
  }

  Future<void> fetchMovies(BuildContext context) async {
    _moviesData.value = await GraphQLService.fetchAvailableMovies(context);
  }

  Widget buildMovieSlider({required int index, required Movie movie}) =>
      AnimatedBuilder(
        animation: _pageController!,
        builder: (context, child) {
          double value = 0;
          if (_pageController!.position.haveDimensions) {
            value = index - _pageController!.page!;
            value = (value * 0.038).clamp(-1, 1);
          }
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 350),
            opacity: initialPage == index ? 1 : 0.4,
            child: Transform.rotate(
              angle: math.pi * value,
              child: MovieCard(movie: movie),
            ),
          );
        },
      );
}
