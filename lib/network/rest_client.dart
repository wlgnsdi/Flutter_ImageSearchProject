import 'package:dio/dio.dart';
import 'package:image_search_project/domain/base_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: '')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/v2/search/image')
  Future<BaseResponse> loadImages();
}
