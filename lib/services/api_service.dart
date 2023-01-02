import 'dart:convert';

import 'package:flutter_for_beginners/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  final String today = "today";

  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');

    final response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        final List<dynamic> webtoons = jsonDecode(response.body);

        for (var webtoon in webtoons) {
          webtoonInstances.add(WebtoonModel.fromJson(webtoon));
        }
      } else if {
        print(response.statusCode != 400 ? response.statusCode != 404 ? 'Sever Error' : 'Bad Request' : 'Not Found');
      }

      return webtoonInstances;
    } catch (err) {
      print(err);
      throw Error();
    }
  }
}
