import 'package:divan_test_task_rshb/bloc/products_list_bloc.dart';
import 'package:divan_test_task_rshb/bloc/states/product_list_state.dart';
import 'package:divan_test_task_rshb/models/category.dart';
import 'package:divan_test_task_rshb/models/sort_order.dart';
import 'package:divan_test_task_rshb/screens/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();

}

class _CategorySelectorState extends State<CategorySelector> {
  @override
  Widget build(BuildContext context) {
    ProductListCubit productListCubit = BlocProvider.of<ProductListCubit>(context);
    return BlocBuilder<ProductListCubit, ProductListState>(
        cubit: productListCubit,
        builder: (context, state) {
          if (state.categories == null)
            return Container(
              height: 76,
            );
          return Container(
            height: 76,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _CategoryItem(
                  iconUri: "assets/icons/sort_icon.svg",
                  title: "Сортировка",
                  active: state.sortOrder == SortOrder.priceAsc,
                  onTap: () {
                    if (state.sortOrder == SortOrder.ratingDesc)
                      productListCubit.selectSort(SortOrder.priceAsc);
                    else
                      productListCubit.selectSort(SortOrder.ratingDesc);
                  },
                ),
                ...List<Widget>.generate(state.categories.length, (index) {
                  Category category = state.categories[index];
                  return _CategoryItem(
                    iconUri: category.iconUri,
                    title: category.title,
                    active: state.selectedCategory == category,
                    onTap: () {
                      if (category == state.selectedCategory) {
                        productListCubit.selectCategory(null);
                      } else {
                        productListCubit.selectCategory(category);
                      }
                    },
                  );
                })
              ],
            ),
          );
        });
  }
}

class _CategoryItem extends StatelessWidget {
  final bool active;
  final String iconUri;
  final String title;
  final VoidCallback onTap;

  _CategoryItem({this.iconUri, this.title, this.active, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
            margin: const EdgeInsets.symmetric(horizontal: 21),
            height: 40,
            width: 40,
            child: iconUri != null
                ? Center(
                    child: SvgPicture.asset(
                    iconUri,
                    width: 16,
                    height: 16,
                    color: active ? Colors.white : Colors.black,
                  ))
                : null,
            decoration: BoxDecoration(
                color: active ? RshbColors.primary : null,
                borderRadius: BorderRadius.circular(25),
                border: active ? null : Border.all(color: RshbColors.greyE0, width: 1),
                boxShadow: active
                    ? [BoxShadow(color: RshbColors.primary.withOpacity(0.4), blurRadius: 10, offset: Offset(2, 2))]
                    : null),
            duration: Duration(milliseconds: 300),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: RshbColors.grey96),
            ),
          )
        ],
      ),
    );
  }
}
