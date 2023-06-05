import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'API.dart';

/// fake data
class MockRequest {
  Future<dynamic> get(String action, {Map? params}) async {
    return mock(action: getJsonName(action), params: params);
  }

  Future<dynamic> post({required String action, Map? params}) async {
    return mock(action: action, params: params);
  }

  Future<dynamic> mock({required String action, Map? params}) async {
    var responseStr = await rootBundle.loadString('fake_data/$action.json');
    var responseJson = json.decode(responseStr);
    return responseJson;
  }

  Future<dynamic> mock2(String action) async {
    var responseStr = await rootBundle.loadString('fake_data/$action.json');
    var responseJson = json.decode(responseStr);
    return responseJson;
  }

  Map<String, String> map = {
    API.IN_THEATERS: 'in_theaters',
    API.COMING_SOON: 'coming_soon',
    API.HOME_PAGE: 'home_page',
    API.WEEKLY: 'weekly',
    API.REIVIEWS: 'reviews',
  };

  getJsonName(String action) {
    return map[action];
  }
}
