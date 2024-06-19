import 'package:flutter/cupertino.dart';
import 'package:image_search_project/base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  Future searchImage() async {
    var search = '주식';
    remote.loadImages(search).then((value) async {
      int size = value.imageDocument?.length ?? 0;
      for(int i = 0; i < size; i++){
      debugPrint(value.imageDocument?[i].toString());

      }
    });
  }
}