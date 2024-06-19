import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_search_project/network/rest_client.dart';

class RetrofitNetwork {
  factory RetrofitNetwork() {
    return _retrofitNetwork;
  }

  RetrofitNetwork._internal();
  static final RetrofitNetwork _retrofitNetwork = RetrofitNetwork._internal();

  Dio dio = Dio(BaseOptions(
    receiveDataWhenStatusError: true,
    sendTimeout: const Duration(seconds: 5),
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  ));

  RestClient defaultUrl() {
    dio.options.headers["Authorization"] = dotenv.env['rest_key'];
    // dio.interceptors.add(LogInterceptor(requestHeader: true, requestBody: true, responseBody: true));
    var client = RestClient(dio, baseUrl: dotenv.env['base_url'] ?? '');
    return client;
  }
}
