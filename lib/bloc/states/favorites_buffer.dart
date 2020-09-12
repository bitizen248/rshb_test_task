import 'package:divan_test_task_rshb/models/product.dart';

class FavoritesBuffer {
  Set<int> addToFavoritesBuffer = Set();
  Set<int> removeFromFavoritesBuffer = Set();

  FavoritesBuffer();

  FavoritesBuffer.copy(FavoritesBuffer buffer) {
    this.addToFavoritesBuffer = Set.from(buffer.addToFavoritesBuffer);
    this.removeFromFavoritesBuffer = Set.from(buffer.removeFromFavoritesBuffer);
  }

  bool isProductInFavorite(Product product) {
    if (addToFavoritesBuffer.contains(product.id))
      return true;
    if (removeFromFavoritesBuffer.contains(product.id))
      return false;
    return product.favorite;
  }
}
