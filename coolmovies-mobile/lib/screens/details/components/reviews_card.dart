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
      width: MediaQuery
          .of(context)
          .size
          .width * 0.9,
      height: 100,
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05, vertical: 10),
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
        padding:
        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset("assets/icons/star_fill.svg"),
                const SizedBox(height: kDefaultPadding / 4),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "5.0",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      TextSpan(text: "10\n"),
                      TextSpan(
                        text: "150,212",
                        style: TextStyle(color: kTextLightColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Rate this
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset("assets/icons/star.svg"),
                SizedBox(height: kDefaultPadding / 4),
                Text("Rate This",
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText2),
              ],
            ),
            // Metascore
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color(0xFF51CF66),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(
                    "4.0",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: kDefaultPadding / 4),
                Text(
                  "Metascore",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  "62 critic reviews",
                  style: TextStyle(color: kTextLightColor),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}