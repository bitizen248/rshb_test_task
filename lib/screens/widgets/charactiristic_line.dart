import 'package:divan_test_task_rshb/models/characteristic.dart';
import 'package:divan_test_task_rshb/screens/colors.dart';
import 'package:flutter/material.dart';

class CharacteristicLine extends StatelessWidget {
  final Characteristic characteristic;

  CharacteristicLine({Key key, this.characteristic}) : super(key: key);

  CharacteristicLine.fromTitleAndValue({Key key, String title, String value})
      : this.characteristic = Characteristic(title, value),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: <Widget>[
          Text(
            characteristic.title,
            style: TextStyle(fontSize: 12, color: RshbColors.grey96),
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "." * 200,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: TextStyle(color: RshbColors.greyDA, fontSize: 12),
                )),
          ),
          Text(
            characteristic.value,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
