import 'package:flutter/cupertino.dart';
import 'package:image_search_project/data/repository/remote_data_source_impl.dart';
import 'package:image_search_project/db/db_helper.dart';
import 'package:image_search_project/network/retfofit_network.dart';

abstract class BaseViewModel extends ChangeNotifier {
  final DBHelper db = DBHelper();

  RemoteDataSourceImpl remote =
      RemoteDataSourceImpl(restClient: RetrofitNetwork().defaultUrl());
}
