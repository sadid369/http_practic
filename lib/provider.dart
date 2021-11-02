import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String? id;
  final String? title;
  final double price;
  Product({
    required this.id,
    required this.title,
    required this.price,
  });
}

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get item {
    return [..._items];
  }

  Product filterItembyID(String? id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> addItem(Product product) async {
    const url =
        'https://http-practic-default-rtdb.asia-southeast1.firebasedatabase.app/products.json';

    http
        .post(Uri.parse(url),
            body: json.encode({
              'title': product.title,
              'price': product.price,
            }))
        .catchError((error) {
      print(error);
      throw error;
    }).then((response) {
      final newProduct = Product(
          id: json.decode(response.body)['name'],
          title: product.title,
          price: product.price);
      _items.add(newProduct);
      print(newProduct.title);
      notifyListeners();
    });
  }

  Future<void> deleteProduct(String id) async {
    var url =
        'https://http-practic-default-rtdb.asia-southeast1.firebasedatabase.app/products/$id.json';
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    Product? exixtingProduct = _items[existingProductIndex];
    await http.delete(Uri.parse(url)).catchError((error) {
      _items.insert(existingProductIndex, exixtingProduct!);
      notifyListeners();
    }).then((_) {
      _items.removeAt(existingProductIndex);
      notifyListeners();
      exixtingProduct = null;
    });
  }

  Future<void> updateData(String id, Product product) async {
    var url =
        'https://http-practic-default-rtdb.asia-southeast1.firebasedatabase.app/products/$id.json';
    await http
        .patch(Uri.parse(url),
            body: json.encode({
              'title': product.title,
              'price': product.price,
            }))
        .catchError((error) {
      print(error);
      throw error;
    }).then((_) {
      final prodIndex = _items.indexWhere((prod) => prod.id == id);
      _items[prodIndex] = product;
      notifyListeners();
    });
  }

  Future<void> fatchData() async {
    const url =
        'https://http-practic-default-rtdb.asia-southeast1.firebasedatabase.app/products.json';
    await http.get(Uri.parse(url)).catchError((error) {
      print(error);
      throw error;
    }).then((response) {
      final List<Product> _loadedData = [];
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((itemId, itemData) {
        _loadedData.add(Product(
            id: itemId, title: itemData['title'], price: itemData['price']));
      });
      _items = _loadedData;
      notifyListeners();
    });
  }
}
