import 'dart:convert';

import 'package:firebase_app/model/product.dart';
import 'package:http/http.dart' as http;

class ProductList{

  // A url do seu "Realtime Database" pode ser inserida aqui.
  final String _baseUrl = "https://jovens-aprendizes-project-default-rtdb.firebaseio.com/";

  List<Product> _items = [];

  List<Product> get items => _items;
  

  Future<void> getItems() async {
    try {

      final request = await http.get(
        Uri.parse("$_baseUrl/products.json"),
      );

      final response = jsonDecode(request.body);

      _items = [];

      if(response == null) return;

      for(final key in response.keys){
        _items.add(
          Product(
            id: key,
            name: response[key]["name"], 
            price: double.parse(response[key]["price"].toString()),
          )
        );
      }
    } catch(_) {
      throw Exception("Erro ao realizar operação.");
    }
  }

  Future<void> addItem(Product newItem) async {

    try{
      final request = await http.post(
        Uri.parse("$_baseUrl/products.json"),
        body: jsonEncode(newItem)
      );

      final response = jsonDecode(request.body);

      newItem.id = response["name"];
      _items.add(newItem);      
    } catch(_) {
      throw Exception("Erro ao realizar operação.");
    }

  }

  Future<void> removeItem(String id) async {
     try{
      await http.delete(
        Uri.parse("$_baseUrl/products/$id.json"),
      );

    _items.removeWhere((product) => product.id == id);
    } catch(_) {
      throw Exception("Erro ao realizar operação.");
    }
  }

  Future<void> editItem(Product newItem) async {

     try{
      await http.put(
        Uri.parse("$_baseUrl/products/${newItem.id}.json"),
        body: jsonEncode(
          {
            "name" : newItem.name,
            "price" : newItem.price
          }
        )
      );

   
    int index = _items.indexWhere((product) => product.id == newItem.id);
    _items[index] = newItem;
    } catch(_) {
      throw Exception("Erro ao realizar operação.");
    }
  }
}