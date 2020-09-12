import 'package:divan_test_task_rshb/bloc/products_list_bloc.dart';
import 'package:divan_test_task_rshb/bloc/states/product_list_state.dart';
import 'package:divan_test_task_rshb/models/product.dart';
import 'package:divan_test_task_rshb/screens/widgets/category_selector.dart';
import 'package:divan_test_task_rshb/screens/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/// Вкладка списка товарос
class ProductsTab extends StatefulWidget {
  @override
  _ProductsTabState createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {

  @override
  Widget build(BuildContext context) {
    ProductListCubit productListCubit = BlocProvider.of<ProductListCubit>(context);
    return BlocBuilder<ProductListCubit, ProductListState>(
      cubit: productListCubit,
      builder: (context, state) {
        if (state.categories == null)
          return Center(
            child: CircularProgressIndicator(),
          );
        return ListView(
          padding: EdgeInsets.only(bottom: 16),
          children: [
            if (state.products == null)
              Center(child: CircularProgressIndicator())
            else
              GridView.count(
                primary: false,
                shrinkWrap: true,
                crossAxisCount: 2,
                padding: EdgeInsets.symmetric(horizontal: 16),
                mainAxisSpacing: 7,
                crossAxisSpacing: 7,
                childAspectRatio: ((MediaQuery.of(context).size.width - 39) / 2) / 307,
                children: List.generate(state.products.length, (index) {
                  Product product = state.products[index];
                  return ProductCard(
                    product: product,
                  );
                }),
              )
          ],
        );
      },
    );
  }
}
