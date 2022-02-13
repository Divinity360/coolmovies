import 'package:flutter/material.dart';
import 'package:coolmovies/constants.dart';
import 'package:flutter/rendering.dart';
import 'categories.dart';
import 'movie_carousel.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(child: Column(
        children: const <Widget>[
          HomePageHeader(),
          SizedBox(height: kDefaultPadding),
          MovieCarousel(),
        ],
      ),) ,
    );
  }
}
