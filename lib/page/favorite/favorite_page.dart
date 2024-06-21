import 'package:flutter/material.dart';
import 'package:image_search_project/page/favorite/favorite_page_listview.dart';
import 'package:image_search_project/shared_data.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    SharedDataModel viewModel = context.watch<SharedDataModel>();
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        viewModel.favoriteList().isNotEmpty
            ? const Expanded(child: FavoritePageListView())
            : Center(child: Text('즐겨찾기를 추가하세요'))
      ],
    ));
  }
}
