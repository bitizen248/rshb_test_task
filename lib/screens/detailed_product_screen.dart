import 'package:divan_test_task_rshb/models/characteristic.dart';
import 'package:divan_test_task_rshb/models/product.dart';
import 'package:divan_test_task_rshb/screens/colors.dart';
import 'package:divan_test_task_rshb/screens/widgets/accordion.dart';
import 'package:divan_test_task_rshb/screens/widgets/charactiristic_line.dart';
import 'package:divan_test_task_rshb/screens/widgets/favorite_badge.dart';
import 'package:divan_test_task_rshb/screens/widgets/rating_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailedProductScreen extends StatelessWidget {
  final Product product;

  const DetailedProductScreen({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 241,
              floating: false,
              pinned: true,
              leading: Center(
                child: GestureDetector(
                  onTap: () => Navigator.maybePop(context),
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Center(
                        child: SvgPicture.asset(
                      "assets/icons/back_icon.svg",
                      width: 16,
                      height: 16,
                    )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: RshbColors.greyE0, width: 1),
                    ),
                  ),
                ),
              ),
              actions: [Center(child: FavoriteBadge())],
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  centerTitle: true,
                  background: Image.asset(
                    product.image,
                    height: 242,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                  )),
            )
          ];
        },
        body: ListView(
          padding: EdgeInsets.only(left: 16, right: 16, top: 30, bottom: 30),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: RichText(
                maxLines: 2,
                text: TextSpan(
                    text: product.title,
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500, color: Colors.black),
                    children: [
                      TextSpan(text: " / ${product.unit}", style: TextStyle(fontSize: 12, color: RshbColors.grey96))
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: RatingBadge(
                rating: product.totalRating,
                voteCount: product.ratingCount,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 54.0),
              child: Text("${product.price.toInt()} ₽", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Text(
                product.description,
                style: TextStyle(fontSize: 14),
              ),
            ),
            for (Characteristic c in product.characteristics.length > 5
                ? product.characteristics.getRange(0, 5)
                : product.characteristics)
              CharacteristicLine(
                characteristic: c,
              ),
            if (product.characteristics.length > 5)
              Accordion(
                accordionTitle: "Все харакетристики",
                characteristics: product.characteristics.sublist(5),
              )
          ],
        ),
      ),
    );
  }
}
