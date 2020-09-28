import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:laptop_mobile/extensions/env/env.dart';
import 'package:laptop_mobile/models/repos/laptop_model/laptop.dart';

class LaptopRepository {
  String laptops = 'laptops';
  Future<List<Laptop>> fetchLaptops() async {
    final res = await http.get(Env.baseUrl(laptops), headers: Env.baseHeader);
    if (res.statusCode == 200) {
      Iterable it = json.decode(res.body);
      List<Laptop> laptops = it.map((json) => Laptop.fromJson(json)).toList();
      return laptops;
    } else {
      throw Exception('Fail to fetch laptops db - + ${res.statusCode}');
    }
  }
}
