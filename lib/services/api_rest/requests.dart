import 'dart:convert';

import 'package:comic_book/helpers/helpers.dart';
import 'package:http/http.dart' as http;

abstract class ApiRequest {
  static String apiKey = "e8b0332f23438a62d162ca8fb0d6917db6061c52";
  static String baseURL = "http://comicvine.gamespot.com/api";
  static Future<dynamic> getRequest(String path) async {
    try {
      final response = await http.get(
          Uri.parse(
            '$baseURL$path',
          ),
          headers: {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Headers': 'Content-Type',
            'Referrer-Policy': 'no-referrer-when-downgrade',
          });
      final decodedResponse = jsonDecode(response.body);
      return decodedResponse;
    } catch (e) {
      showWebSnackBar('Error making HTTP Request', 'Reload the page please',
          isWarning: true);
    }
  }
}
