import 'package:flutter/material.dart';
import '../../../constants.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Movies In Theatre",
            style: Theme.of(context).textTheme.headline5?.copyWith(
              fontWeight: FontWeight.w800,
              color: kTextColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            height: 6,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kSecondaryColor,
            ),
          )
        ],
      ),
    );
  }

}
