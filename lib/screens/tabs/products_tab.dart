import 'package:divan_test_task_rshb/bloc/products_list_bloc.dart';
import 'package:divan_test_task_rshb/bloc/states/product_list_state.dart';
import 'package:divan_test_task_rshb/models/product.dart';
import 'package:divan_test_task_rshb/screens/widgets/category_selector.dart';
import 'package:divan_test_task_rshb/screens/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsTab extends StatelessWidget {
  final ProductListCubit _productListCubit = ProductListCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListCubit, ProductListState>(
      cubit: _productListCubit,
      buildWhen: (oldState, newState) => oldState != newState,
      builder: (context, state) {
        if (state.categories == null)
          return Center(
            child: CircularProgressIndicator(),
          );
        return ListView(
          primary: false,
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: 16),
          children: [
            CategorySelector(
              selectedCategory: state.selectedCategory,
              sortOrder: state.sortOrder,
              categories: state.categories,
              onCategorySelect: (category) => _productListCubit.selectCategory(category),
              onSortSelect: (sort) => _productListCubit.selectSort(sort),
            ),
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
