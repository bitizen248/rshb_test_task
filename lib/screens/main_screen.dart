import 'package:divan_test_task_rshb/screens/tabs/products_tab.dart';
import 'package:divan_test_task_rshb/screens/widgets/tab_selector.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

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
            onTabSelect: (i) => _tabController.animateTo(i),
            tabs: [
              SectionTab("Продукты"),
              SectionTab("Продукты"),
              SectionTab("Продукты"),
            ],
          ),
          ProductsTab(),
        ],
      ),
    );
  }
}
