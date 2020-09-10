import 'package:divan_test_task_rshb/screens/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var i = 0; i < 20; i++)
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = i;
                });
              },
              child: _CategoryItem(
                active: selectedCategory == i,
                title: "Овощи и фрукты",
              ),
            ),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final bool active;
  final String iconUri;
  final String title;

  _CategoryItem({this.iconUri, this.title, this.active});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 21),
          height: 40,
          width: 40,
          child: iconUri != null ? SvgPicture.asset(iconUri) : null,
          decoration: BoxDecoration(
              color: active ? RshbColors.primary : null,
              borderRadius: BorderRadius.circular(25),
              border: active ? null : Border.all(color: RshbColors.greyE0, width: 1)),
          duration: Duration(milliseconds: 500),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: RshbColors.grey96),
          ),
        )
      ],
    );
  }
}
