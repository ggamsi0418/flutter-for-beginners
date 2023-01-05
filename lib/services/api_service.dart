import 'dart:convert';

import 'package:flutter_for_beginners/models/webtoon_detail_model.dart';
import 'package:flutter_for_beginners/models/webtoon_episode_model.dart';
import 'package:flutter_for_beginners/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');

    final response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        final List<dynamic> webtoons = jsonDecode(response.body);

        for (var webtoon in webtoons) {
          webtoonInstances.add(WebtoonModel.fromJson(webtoon));
        }
      } else {
        print(response.statusCode == 400
            ? 'Bad Request'
            : response.statusCode == 404
                ? 'Not Found'
                : 'Sever Error');
      }

      return webtoonInstances;
    } catch (err) {
      throw Error();
    }
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    // final List<WebtoonDetailModel> episodeInstances = [];
    final url = Uri.parse('$baseUrl/$id');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);

      return WebtoonDetailModel.fromJson(webtoon);
    } else {
      print(response.statusCode == 400
          ? 'Bad Request'
          : response.statusCode == 404
              ? 'Not Found'
              : 'Sever Error');
    }

    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    // final List<WebtoonDetailModel> episodeInstances = [];

    final url = Uri.parse('$baseUrl/$id/episodes');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> episodes = jsonDecode(response.body);

      return episodes
          .map((episode) => WebtoonEpisodeModel.fromJson(episode))
          .toList();

      // for (var episode in episodes) {
      //   episodeInstances.add(WebtoonDetailModel.fromJson(episode));
      // }

      // return episodeInstances;
    } else {
      print(response.statusCode == 400
          ? 'Bad Request'
          : response.statusCode == 404
              ? 'Not Found'
              : 'Sever Error');
    }

    throw Error();
  }
}
