import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:white_label_project/data_source/http_request.dart';

import '../models/subject_entity.dart';
import 'mock_request.dart';

class API {
  static const BASE_URL = 'moviedb.8610000.xyz';
  static const String ALL_MOVIES = '/q.json';

  ///TOP250
  static const String HOME_PAGE = '/v2/movie/top250';

  ///正在热映
  static const String IN_THEATERS =
      '/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b';

  ///即将上映
  static const String COMING_SOON =
      '/v2/movie/coming_soon?apikey=0b2bdeda43b5688921839c8ecb20399b';

  ///一周口碑榜
  static const String WEEKLY =
      '/v2/movie/weekly?apikey=0b2bdeda43b5688921839c8ecb20399b';

  ///影人条目信息
  static const String CELEBRITY = '/v2/movie/celebrity/';

  static const String REIVIEWS = '/v2/movie/subject/26266893/reviews';

  var _request = HttpRequest(API.BASE_URL);

  var _mockRequest = MockRequest();

  // Only show first 50 for now.
  Future<dynamic> fetchFirst50Movies() async {
    var response = await _request.get(ALL_MOVIES);
    List<Subject> results = response
        .map<Subject>((item) => Subject.fromMap(item))
        .toList()
        .sublist(0, 50);

    return results;
  }
}
