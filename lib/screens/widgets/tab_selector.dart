import 'package:divan_test_task_rshb/screens/colors.dart';
import 'package:flutter/material.dart';

class TabSelector extends StatefulWidget {
  final List<SectionTab> tabs;
  final Function(int) onTabSelect;

  const TabSelector({Key key, this.tabs, this.onTabSelect}) : super(key: key);

  @override
  _TabSelectorState createState() => _TabSelectorState();
}

class _TabSelectorState extends State<TabSelector> with SingleTickerProviderStateMixin {
  int _activeElement = 0;

  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(milliseconds: 300), vsync: this);
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
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    flex: _animation.value,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 100,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: RshbColors.primary,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(color: RshbColors.primary.withOpacity(0.4), blurRadius: 10, offset: Offset(2, 2))
                          ]),
                    ),
                  ),
                  Expanded(
                    flex: ((widget.tabs.length * 100) - _animation.value - 100),
                    child: Container(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  for (var i = 0; i < widget.tabs.length; i++)
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          widget.onTabSelect(i);
                          setState(() {
                            _activeElement = i;
                          });
                          _animationController.animateTo((1 / widget.tabs.length) * i);
                        },
                        child: Center(
                            child: AnimatedDefaultTextStyle(
                                duration: Duration(milliseconds: 300),
                                style: TextStyle(
                                    color: i == _activeElement ? Colors.white : Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                                child: Text(widget.tabs[i].name))),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SectionTab {
  String name;

  SectionTab(this.name);
}
