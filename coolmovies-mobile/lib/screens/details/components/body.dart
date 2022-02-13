import 'package:coolmovies/models/reviews.dart';
import 'package:coolmovies/screens/details/components/reviews_card.dart';
import 'package:coolmovies/services/graphql_service.dart';
import 'package:flutter/material.dart';
import 'package:coolmovies/constants.dart';
import 'package:coolmovies/models/movies.dart';
import 'backdrop_rating.dart';
import 'title_duration_and_fav_btn.dart';

class DetailPageContent extends StatefulWidget {
  final Movie movie;

  const DetailPageContent({Key? key, required this.movie}) : super(key: key);

  @override
  State<DetailPageContent> createState() => _DetailPageContentState();
}

class _DetailPageContentState extends State<DetailPageContent> {
  final ValueNotifier<AllReviews?> _reviewsData = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    fetchReviews(context);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BackdropAndRating(size: size, movie: widget.movie),
          const SizedBox(height: kDefaultPadding / 2),
          TitleDurationAndFabBtn(movie: widget.movie),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: kDefaultPadding / 3,
              horizontal: kDefaultPadding,
            ),
            child: Text(
              "All Reviews",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          ValueListenableBuilder(
              valueListenable: _reviewsData,
              builder: (BuildContext context, AllReviews? data, Widget? _) {
                if (data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final List<Review> reviews = data.reviews!;
                return Container(
                  height: 130 * reviews.length.toDouble(),
                  alignment: Alignment.center,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: reviews.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        ReviewsCard(review: reviews.elementAt(index)),
                  ),
                );
              })
        ],
      ),
    );
  }

  Future<void> fetchReviews(BuildContext context) async {
    _reviewsData.value = await GraphQLService.fetchReviews(context);
  }
}
