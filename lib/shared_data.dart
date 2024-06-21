import 'package:flutter/foundation.dart';
import 'package:image_search_project/base_viewmodel.dart';
import 'package:image_search_project/domain/image_document.dart';

class SharedDataModel extends BaseViewModel {
  List<ImageDocument> list = List.empty(growable: true);

  SharedDataModel() {
    init();
  }

  List<ImageDocument> favoriteList() {
    return list.where((element) => element.isFavorite == true).toList();
  }

  init() {
    db.getAllImageDocument().then((value) async {
      list = value;
      notifyListeners();
    });
  }

  Future<void> searchImage(String search) async{
    await db.deleteAllSearchData();
    remote.loadImages(search).then((value) async {
      List<ImageDocument>? list = value.imageDocument;
      if (list != null) {
        list = value.imageDocument ?? List.empty(growable: true);

        if (list.isNotEmpty) {
          await db.insertAllSearchData(list);
        }
        this.list = await db.getAllImageDocument();
      }

      notifyListeners();
    });
  }

  void update(int index) async {
    list[index].isFavorite = !list[index].isFavorite;
    await db.updateImageDocument(list[index]);
    notifyListeners();
  }
}
