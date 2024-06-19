import 'package:image_search_project/data/remote/remote_data_source.dart';
import 'package:image_search_project/domain/base_response.dart';
import 'package:image_search_project/network/rest_client.dart';

class RemoteDataSourceImpl extends RemoteDataSource{
  RestClient restClient;

  RemoteDataSourceImpl({required this.restClient});

  @override
  Future<BaseResponse> loadImages(String query) {
    return restClient.loadImages(query);
  }

}