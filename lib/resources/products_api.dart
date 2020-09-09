import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:divan_test_task_rshb/models/category.dart';
import 'package:divan_test_task_rshb/models/farmer.dart';
import 'package:divan_test_task_rshb/models/product.dart';
import 'package:divan_test_task_rshb/models/sort_order.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';


/// Класс, позволяющий получать данные по товара
///
/// Объект этого класса существует в едином экземпляре
/// Это нужно для того чтобы каждый раз не иницировать настройки
class ProductsApi {
  static final ProductsApi _singleton = ProductsApi._init();


  /// Настрйоки, в них храним Изранное
  Completer<SharedPreferences> _preferences = Completer();

  factory ProductsApi() {
    return _singleton;
  }

  /// Инициализация синглота
  ProductsApi._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences.complete(value);
    });
  }


  /// Метод, который симулирет задержку сети (600-700 милисекунд)
  Future<void> _simulateNetworkDelay() async {
    await Future.delayed(Duration(milliseconds: Random().nextInt(100) + 600));
  }

  /// Получение данных data.json
  Future<Map<String, dynamic>> _getDataJson() async {
    String jsonData = await rootBundle.loadString("assets/json/data.json");
    return json.decode(jsonData);
  }

  /// Получение списка категорий
  Future<List<Category>> getCategories() async {
    List<Map<String, dynamic>> categoriesJson = (await _getDataJson())["categories"];
    await _simulateNetworkDelay();
    return List.generate(categoriesJson.length, (i) => Category.fromJson(categoriesJson[i]));
  }


  /// Получение списка товаров
  Future<List<Product>> getProducts({Category category, SortOrder order = SortOrder.ratingDesc}) async {
    Map<String, dynamic> dataJson = await _getDataJson();

    Map<int, Category> categoriesMap = Map(); // Словарь категорий. Ключ - id, Значение - объект
    dataJson["categories"].forEach((e) {
      Category c = Category.fromJson(e);
      categoriesMap[c.id] = c;
    });

    Map<int, Farmer> farmersMap = Map(); // Словарь производителей. Ключ - id, Значение - производитель
    dataJson["farmers"].forEach((e) {
      Farmer f = Farmer.fromJson(e);
      farmersMap[f.id] = f;
    });
    List<Product> products = List();
    for (var productJson in dataJson["products"]) {
      Product product = Product.fromJson(productJson);
      product.category = categoriesMap[productJson["categoryId"]]; // подствялем нужную категори
      product.farmer = farmersMap[productJson["farmerId"]]; // подставляем нужного производителя
      // если стоит фильтрация по категориям, то пропускаем этот товар
      if (category != null && product.category != category) continue;
      products.add(product);
    }


    // Сортировка
    switch (order) {
      case SortOrder.ratingDesc: // По рейтенгу, сперва высший
        products.sort((a, b) {
          return -a.totalRating.compareTo(b.totalRating);
        });
        break;
      case SortOrder.priceAsc: // По цене, сперва самая низкая
        products.sort((a, b) {
          return a.price.compareTo(b.price);
        });
        break;
    }
    await _simulateNetworkDelay();
    return products;
  }

  /// Добавление в избранное
  Future<bool> addToFavorites(Product product) {}

  /// Удаление из избранного
  Future<bool> removeFromFavorites(Product product) {}
}
