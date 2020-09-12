import 'package:divan_test_task_rshb/models/product.dart';

/// Буфер избранного
class FavoritesBuffer {
  /// Товары, добавлениые за сессию в избренное
  Set<int> addToFavoritesBuffer = Set();

  /// Товарыб удаленные за сессию из избранного
  Set<int> removeFromFavoritesBuffer = Set();

  FavoritesBuffer();

  /// Копирование состояния
  FavoritesBuffer.copy(FavoritesBuffer buffer) {
    this.addToFavoritesBuffer = Set.from(buffer.addToFavoritesBuffer);
    this.removeFromFavoritesBuffer = Set.from(buffer.removeFromFavoritesBuffer);
  }

  /// Проревка, если ли в буферах товар. Буфер приоритетнее состояние товара
  bool isProductInFavorite(Product product) {
    if (addToFavoritesBuffer.contains(product.id)) return true; // Товар был добавлен в избранное
    if (removeFromFavoritesBuffer.contains(product.id)) return false; // Товар был удален из избранного
    return product.favorite;
  }
}
