import 'package:flutter/material.dart';
import 'package:coolmovies/models/movies.dart';
import 'package:coolmovies/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  const DetailsScreen({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: DetailPageContent(movie: movie),
    );
  }
}
