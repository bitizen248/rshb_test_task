import 'package:divan_test_task_rshb/screens/colors.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  final List<CategoryTab> tabs;

  const CategorySelector({Key key, this.tabs}) : super(key: key);

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> with SingleTickerProviderStateMixin {
  int _activeElement = 0;

  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _animation = IntTween(begin: 0, end: (widget.tabs.length * 100)).animate(_animationController);
    _animation.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: Container(
        height: 50,
        child: Stack(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              decoration: ShapeDecoration(
                color: RshbColors.greyF5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: _animation.value,
                  child: Container(),
                ),
                Expanded(
                  flex: 100,
                  child: Container(
                    height: 50,
                    decoration: ShapeDecoration(
                      color: RshbColors.primary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                ),
                Expanded(
                  flex: ((widget.tabs.length * 100) - _animation.value - 100),
                  child: Container(),
                ),
              ],
            ),
            Row(
              children: [
                for (var i = 0; i < widget.tabs.length; i++)
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        setState(() {
                          _activeElement = i;
                        });
                        _animationController.animateTo((1 / widget.tabs.length) * i);
                      },
                      child: Center(
                          child: AnimatedDefaultTextStyle(
                              duration: Duration(milliseconds: 500),
                              style: TextStyle(color: i == _activeElement ? Colors.white : Colors.black),
                              child: Text(widget.tabs[i].name))),
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CategoryTab {
  String name;

  CategoryTab(this.name);
}
