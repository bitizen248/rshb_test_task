import 'package:divan_test_task_rshb/screens/colors.dart';
import 'package:divan_test_task_rshb/screens/strings.dart';
import 'package:flutter/material.dart';

class RatingBadge extends StatelessWidget {
  final double rating;
  final int voteCount;

  const RatingBadge({Key key, this.rating, this.voteCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color badgeColor;
    if (rating >= 4)
      badgeColor = RshbColors.primary;
    else if (rating >= 3)
      badgeColor = RshbColors.yellow;
    else
      badgeColor = RshbColors.greyBD;
    return Row(
      children: [
        Container(
          width: 22,
          height: 22,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(color: badgeColor, borderRadius: BorderRadius.circular(5)),
          child: Center(
              child: Text(
            rating != null && rating != 0 ? rating.toString() : "－",
            style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
          )),
        ),
        Text(
          "${voteCount} ${Strings.ratingPlural(voteCount)}",
          style: TextStyle(fontSize: 10, color: RshbColors.grey96),
        )
      ],
    );
  }
}
