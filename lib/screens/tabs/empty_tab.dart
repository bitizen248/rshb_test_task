import 'package:flutter/material.dart';

/// Пустая вкладка-заглушка
class EmptyTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text("Здесь пока ничего нет, но скоро будет :)"),
    ));
  }
}
