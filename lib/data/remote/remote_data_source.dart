import 'package:image_search_project/domain/base_response.dart';

abstract class RemoteDataSource {
  Future<BaseResponse> loadImages();
}
