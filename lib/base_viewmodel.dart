import 'package:image_search_project/data/repository/remote_data_source_impl.dart';
import 'package:image_search_project/network/retfofit_network.dart';

abstract class BaseViewModel {
  RemoteDataSourceImpl remote =
      RemoteDataSourceImpl(restClient: RetrofitNetwork().defaultUrl());
}
