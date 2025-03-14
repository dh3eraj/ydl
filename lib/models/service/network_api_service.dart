import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:http/http.dart' show Client, Response;
import 'package:ydl_users/models/app_exception.dart';
import 'package:ydl_users/models/service/base_api_service.dart';

class NetworkApiService implements BaseApiService {
  final Client _client;
  NetworkApiService(this._client);

  @override
  Future<dynamic> getApi(Uri url, {Map<String, String>? headers}) async {
    try {
      final response = await _client
          .get(url, headers: headers)
          .timeout(Duration(seconds: 5));
      return jsonResponse(response);
    } on SocketException catch (_) {
      throw InternetException();
    } on TimeoutException {
      throw RequestTimeOutException();
    } on AppException catch (e, _) {
      throw AppException(message: e.message);
    } catch (_) {
      throw AppException();
    }
  }
}

dynamic jsonResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      return jsonDecode(response.body);
    case 201:
      return jsonDecode(response.body);
    case 404:
      throw UserNotFoundException();
    default:
      throw AppException();
  }
}
enum Status { loading, loaded, error }
