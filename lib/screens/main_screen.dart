import 'package:divan_test_task_rshb/bloc/products_list_bloc.dart';
import 'package:divan_test_task_rshb/screens/tabs/empty_tab.dart';
import 'package:divan_test_task_rshb/screens/tabs/products_tab.dart';
import 'package:divan_test_task_rshb/screens/widgets/category_selector.dart';
import 'package:divan_test_task_rshb/screens/widgets/tab_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;
  double size = 76;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index == 0) {
        setState(() {
          size = 76;
        });
      } else {
        setState(() {
          size = 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductListCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Каталог"),
        ),
        backgroundColor: Colors.white,
        body: NestedScrollView(
          physics: _tabController.index == 0 ? null : NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxisScrolled) {
            return <Widget>[
              SliverAppBar(
                floating: true,
                snap: true,
                toolbarHeight: 0,
                primary: false,
                elevation: innerBoxisScrolled ? 8 : 0,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  centerTitle: true,
                ),
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(110 + size),
                    child: Column(
                      children: [
                        TabSelector(
                          tabController: _tabController,
                          tabs: [
                            SectionTab("Продукты"),
                            SectionTab("Фермеры"),
                            SectionTab("Агротуры"),
                          ],
                        ),
                        if (_tabController.index == 0) CategorySelector(),
                      ],
                    )),
              )
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [ProductsTab(), EmptyTab(), EmptyTab()],
          ),
        ),
      ),
    );
  }
}
