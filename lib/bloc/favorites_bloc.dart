import 'package:divan_test_task_rshb/bloc/states/favorites_buffer.dart';
import 'package:divan_test_task_rshb/models/product.dart';
import 'package:divan_test_task_rshb/resources/products_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/// Bloc, который отвечает за избранное
class FavoritesCubit extends Cubit<FavoritesBuffer> {
  ProductsApi productsApi = ProductsApi();

  FavoritesCubit() : super(FavoritesBuffer());

  /// Добавление в избранное
  Future<bool> addToFavorites(Product product) async {
    FavoritesBuffer buffer = FavoritesBuffer.copy(this.state);
    // Проверяем, если товар был в буфере удаления, то его нужно оттуда убрать
    if (buffer.removeFromFavoritesBuffer.contains(product.id)) buffer.removeFromFavoritesBuffer.remove(product.id);
    buffer.addToFavoritesBuffer.add(product.id); // добавляем товар в буфер добавления
    bool res = await productsApi.addToFavorites(product); // сохраняем изменение
    if (res) emit(buffer); // если не удалось добавить в избранное, значит новый state не актуален
    return res;
  }

  /// Удаление из избранного
  Future<bool> removeFromFavorites(Product product) async {
    FavoritesBuffer buffer = FavoritesBuffer.copy(this.state);
    // Проверяем, если товар был в буфере добавления, то его нужно оттуда убрать
    if (buffer.addToFavoritesBuffer.contains(product.id)) buffer.addToFavoritesBuffer.remove(product.id);
    buffer.removeFromFavoritesBuffer.add(product.id);// добавляем товар в буфер удаления
    bool res = await productsApi.removeFromFavorites(product); // сохраняем изменение
    if (res) emit(buffer); // если неу далось убрать из избранного, значит новый state не актуален
    return res;
  }
}
