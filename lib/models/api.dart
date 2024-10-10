import 'dart:convert';
import 'package:education/models/response_model.dart';
import 'package:http/http.dart' as http;

class API {
  static const String baseUrl = "https://api.dictionaryapi.dev/api/v2/entries/en/";

  static Future<ResponseModel> fetchMeaning(String word, {String? language}) async {
    final uri = language != null ? Uri.parse("$baseUrl$word?language=$language") : Uri.parse("$baseUrl$word");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ResponseModel.fromJson(data[0]);
    } else {
      throw Exception('Failed to load meaning');
    }
  }
}


