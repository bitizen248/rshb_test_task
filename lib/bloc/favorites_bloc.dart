import 'package:divan_test_task_rshb/bloc/states/favorites_buffer.dart';
import 'package:divan_test_task_rshb/models/product.dart';
import 'package:divan_test_task_rshb/resources/products_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<FavoritesBuffer> {
  ProductsApi productsApi = ProductsApi();

  FavoritesCubit() : super(FavoritesBuffer());

  Future<bool> addToFavorites(Product product) async {
    FavoritesBuffer buffer = FavoritesBuffer.copy(this.state);
    if (buffer.removeFromFavoritesBuffer.contains(product.id)) buffer.removeFromFavoritesBuffer.remove(product.id);
    buffer.addToFavoritesBuffer.add(product.id);
    bool res = await productsApi.addToFavorites(product);
    if (res) emit(buffer);
    return res;
  }

  Future<bool> removeFromFavorites(Product product) async {
    FavoritesBuffer buffer = FavoritesBuffer.copy(this.state);
    if (buffer.addToFavoritesBuffer.contains(product.id)) buffer.addToFavoritesBuffer.remove(product.id);
    buffer.removeFromFavoritesBuffer.add(product.id);
    bool res = await productsApi.removeFromFavorites(product);
    if (res) emit(buffer);
    return res;
  }
}
