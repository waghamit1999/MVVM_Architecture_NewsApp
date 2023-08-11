import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

class APIService {
  Future<dynamic> getRequest(String url) async {
    try {
      final response = await get(Uri.parse(url));
      return _processResponse(response);
    } on SocketException {
      throw Exception('No Internet Connection');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> postRequest(String url, Map body) async {
    try {
      final response = await post(Uri.parse(url), body: jsonEncode(body));
      return _processResponse(response);
    } on SocketException {
      throw Exception('No Internet Connection');
    } catch (e) {
      rethrow;
    }
  }

  dynamic _processResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 401:
        final mapResponse = jsonDecode(response.body);
        throw Exception(mapResponse['message'] ?? 'Failed To Authorize');
      case 500:
        throw Exception('Internal Server Error');
      default:
        throw Exception('Something wents wrong');
    }
  }
}
