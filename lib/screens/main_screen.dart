import 'package:divan_test_task_rshb/screens/widgets/category_selector.dart';
import 'package:divan_test_task_rshb/screens/widgets/product_card.dart';
import 'package:divan_test_task_rshb/screens/widgets/tab_selector.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Каталог"),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          TabSelector(
            tabs: [
              SectionTab("Продукты"),
              SectionTab("Продукты"),
              SectionTab("Продукты"),
            ],
          ),
          CategorySelector(),
          GridView.count(
            primary: false,
            shrinkWrap: true,
            crossAxisCount: 2,
            padding: EdgeInsets.symmetric(horizontal: 16),
            mainAxisSpacing: 7,
            crossAxisSpacing: 7,
            childAspectRatio: ((MediaQuery.of(context).size.width - 39)/2) / 307,
            children: [
              ProductCard(),
              ProductCard(),
              ProductCard(),
              ProductCard(),
              ProductCard(),
            ],
          )
        ],
      ),
    );
  }
}
