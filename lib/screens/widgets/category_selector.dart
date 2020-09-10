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
      height: 300,
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
                title: "Text",
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
          height: 50,
          width: 50,
          child: iconUri != null ? SvgPicture.asset(iconUri) : null,
          decoration: BoxDecoration(
              color: active ? RshbColors.primary : null,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.black, width: 1)),
          duration: Duration(milliseconds: 500),
        ),
        Text(title)
      ],
    );
  }
}
