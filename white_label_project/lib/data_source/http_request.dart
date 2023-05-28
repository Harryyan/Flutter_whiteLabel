import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

typedef RequestCallBack = void Function(Map data);

class HttpRequest {
  dynamic baseUrl;

  HttpRequest(this.baseUrl);

  Future<dynamic> get(String path, {Map<String, String>? headers}) async {
    try {
      var uri = Uri.https(baseUrl, path);
      http.Response response = await http.get(uri, headers: headers);
      final body = response.body;
      var result = json.decode(body);
      return result;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return '';
    }
  }
}
