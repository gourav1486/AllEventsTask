import 'dart:convert';

import 'package:all_events_project/models/categories_model.dart';
import 'package:http/http.dart' as http;

class GetCategoriesRepo {
  Future<List<CategoriesModel>> getCategories() async {
    List<CategoriesModel> catgories = [];
    const String url =
        'https://allevents.s3.amazonaws.com/tests/categories.json';
    http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      final List obj = json.decode(res.body);
      if (catgories.isEmpty) {
        obj.forEach((element) {
          catgories.add(CategoriesModel.fromJson(element));
        });
      } else {
        catgories.clear();
         obj.forEach((element) {
          catgories.add(CategoriesModel.fromJson(element));
        });
      }
    }
    return catgories;
  }
}
