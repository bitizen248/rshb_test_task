import 'package:bloc/bloc.dart';
import 'package:divan_test_task_rshb/bloc/states/product_list_state.dart';
import 'package:divan_test_task_rshb/models/category.dart';
import 'package:divan_test_task_rshb/models/product.dart';
import 'package:divan_test_task_rshb/models/sort_order.dart';
import 'package:divan_test_task_rshb/resources/products_api.dart';

class ProductListCubit extends Cubit<ProductListState> {
  ProductsApi productsApi = ProductsApi();

  ProductListCubit() : super(ProductListState()) {
    loadData();
  }

  /// Загрузка данных
  void loadData() async {
    ProductListState state = ProductListState.copy(this.state);
    if (state.categories == null) {
      List<Category> categories = await productsApi.getCategories();
      state.categories = categories;
    }
    List<Product> products = await productsApi.getProducts(order: state.sortOrder, category: state.selectedCategory);
    state.products = products;
    emit(state);
  }

  /// Выбор сортировки
  void selectSort(SortOrder sortOrder) async {
    ProductListState state = ProductListState.copy(this.state);
    state.sortOrder = sortOrder;
    state.products = null;
    emit(state);
    loadData();
  }

  /// Выбор категории
  void selectCategory(Category category) async {
    ProductListState state = ProductListState.copy(this.state);
    state.selectedCategory = category;
    state.products = null;
    emit(state);
    loadData();
  }
}
