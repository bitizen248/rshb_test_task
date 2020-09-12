import 'package:divan_test_task_rshb/models/product.dart';
import 'package:divan_test_task_rshb/screens/colors.dart';
import 'package:divan_test_task_rshb/screens/widgets/favorite_badge.dart';
import 'package:divan_test_task_rshb/screens/widgets/rating_badge.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), border: Border.all(color: RshbColors.greyE0, width: 1)),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 121,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  product.image,
                  height: 121,
                  width: 307,
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                ),
              ),
              FavoriteBadge()
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 36,
                  child: RichText(
                    maxLines: 2,
                    text: TextSpan(
                        text: product.title,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                        children: [
                          TextSpan(text: " / ${product.unit}", style: TextStyle(fontSize: 12, color: RshbColors.grey96))
                        ]),
                  ),
                ),
                RatingBadge(
                  rating: product.totalRating,
                  voteCount: product.ratingCount,
                ),
                Container(
                    height: 24,
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    child: Text(
                      product.shortDescription,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 10, color: RshbColors.grey96),
                    )),
                Container(
                    height: 33,
                    child: Text(
                      product.farmer.title,
                      style: TextStyle(fontSize: 12),
                    )),
                Text(
                  "${product.price.toInt()} ₽",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
