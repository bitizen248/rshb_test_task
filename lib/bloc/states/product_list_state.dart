import 'package:divan_test_task_rshb/models/category.dart';
import 'package:divan_test_task_rshb/models/product.dart';
import 'package:divan_test_task_rshb/models/sort_order.dart';

/// Состояние для списка товаров
class ProductListState {

  /// Список категорий
  List<Category> categories;

  /// Выбранная категория
  Category selectedCategory;

  /// Типи и порядок сортировки
  SortOrder sortOrder;

  /// Список товаров
  List<Product> products;

  ProductListState({this.categories, this.selectedCategory, this.sortOrder = SortOrder.ratingDesc, this.products});

  ProductListState.copy(ProductListState state) {
    this.categories = state.categories;
    this.selectedCategory = state.selectedCategory;
    this.sortOrder = state.sortOrder;
    this.products = state.products;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductListState &&
          runtimeType == other.runtimeType &&
          categories == other.categories &&
          selectedCategory == other.selectedCategory &&
          sortOrder == other.sortOrder &&
          products == other.products;

  @override
  int get hashCode => categories.hashCode ^ selectedCategory.hashCode ^ sortOrder.hashCode ^ products.hashCode;
}
