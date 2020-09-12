import 'package:divan_test_task_rshb/models/category.dart';
import 'package:divan_test_task_rshb/models/sort_order.dart';
import 'package:divan_test_task_rshb/screens/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategorySelector extends StatefulWidget {
  final List<Category> categories;
  final Category selectedCategory;
  final SortOrder sortOrder;

  final Function(Category) onCategorySelect;
  final Function(SortOrder) onSortSelect;

  const CategorySelector(
      {Key key,
      this.selectedCategory,
      this.sortOrder = SortOrder.ratingDesc,
      this.onCategorySelect,
      this.onSortSelect,
      @required this.categories})
      : super(key: key);

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  Category _selectedCategory;
  SortOrder _sortOrder;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.selectedCategory;
    _sortOrder = widget.sortOrder;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _CategoryItem(
            iconUri: "assets/icons/sort_icon.svg",
            title: "Сортировка",
            active: _sortOrder == SortOrder.priceAsc,
            onTap: () {
              setState(() {
                if (widget.sortOrder == SortOrder.ratingDesc)
                  _sortOrder = SortOrder.priceAsc;
                else
                  _sortOrder = SortOrder.ratingDesc;
                widget.onSortSelect(_sortOrder);
              });
            },
          ),
          ...List<Widget>.generate(widget.categories.length, (index) {
            Category category = widget.categories[index];
            return _CategoryItem(
              iconUri: category.iconUri,
              title: category.title,
              active: _selectedCategory == category,
              onTap: () {
                if (category == _selectedCategory) {
                  widget.onCategorySelect(null);
                  setState(() {
                    _selectedCategory = null;
                  });
                } else {
                  widget.onCategorySelect(category);
                  setState(() {
                    _selectedCategory = category;
                  });
                }
              },
            );
          })
        ],
      ),
    );
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
