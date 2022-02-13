import 'package:coolmovies/constants.dart';
import 'package:coolmovies/models/reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewsCard extends StatelessWidget {
  final Review review;

  const ReviewsCard({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 100,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 50,
            color: Color(0xFF12153D).withOpacity(0.2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  review.title!,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(child: Text( review.body!,
                  style: const TextStyle(color: kTextLightColor, ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ), width: 210,)

              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset("assets/icons/star_fill.svg"),
                const SizedBox(height: kDefaultPadding / 4),
                Text( review.rating!.toDouble().toString(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
