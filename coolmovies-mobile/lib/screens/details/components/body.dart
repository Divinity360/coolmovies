import 'package:flutter/material.dart';
import 'package:coolmovies/constants.dart';
import 'package:coolmovies/models/movies.dart';
import 'backdrop_rating.dart';
import 'title_duration_and_fav_btn.dart';

class DetailPageContent extends StatelessWidget {
  final Movie movie;

  const DetailPageContent({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // it will provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BackdropAndRating(size: size, movie: movie),
          SizedBox(height: kDefaultPadding / 2),
          TitleDurationAndFabBtn(movie: movie),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: kDefaultPadding / 2,
              horizontal: kDefaultPadding,
            ),
            child: Text(
              "Plot Summary",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(

            "Lorem Ipsum",
              style: TextStyle(
                color: Color(0xFF737599),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
