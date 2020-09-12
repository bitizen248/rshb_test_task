import 'package:divan_test_task_rshb/models/characteristic.dart';
import 'package:divan_test_task_rshb/screens/colors.dart';
import 'package:divan_test_task_rshb/screens/widgets/charactiristic_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Accordion extends StatefulWidget {
  final List<Characteristic> characteristics;
  final String accordionTitle;

  const Accordion({Key key, this.characteristics, this.accordionTitle}) : super(key: key);

  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> with SingleTickerProviderStateMixin {
  bool _visible = false;
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: -0.25).animate(_controller);
  }

  void _changeVisible() {
    setState(() {
      _visible ? _controller.reverse() : _controller.forward();
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedCrossFade(
              crossFadeState: _visible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
              firstChild: Column(
                children: List.generate(
                    widget.characteristics.length,
                    (index) => CharacteristicLine(
                          characteristic: widget.characteristics[index],
                        )),
              ),
              secondChild: Container()),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => _changeVisible(),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    widget.accordionTitle,
                    style: TextStyle(color: RshbColors.primary, fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ),
                RotationTransition(
                  turns: _animation,
                  child: SvgPicture.asset('assets/icons/arrow_right_icon.svg'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
