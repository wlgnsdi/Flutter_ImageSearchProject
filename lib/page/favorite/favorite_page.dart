import 'package:flutter/material.dart';
import 'package:image_search_project/page/detail/detail_page.dart';
import 'package:image_search_project/shared_data.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    SharedDataModel viewModel = context.watch<SharedDataModel>();

    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: viewModel.favoriteList().length,
                itemBuilder: (context, position) {
                  return TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailPage(
                                viewModel.favoriteList()[position])));
                      },
                      child: Column(
                        children: [
                          Image(
                              image: NetworkImage(viewModel
                                  .favoriteList()[position]
                                  .getThumbnailImage())),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  '${viewModel.favoriteList()[position].displaySitename}'),
                              ToggleButtons(
                                isSelected: [
                                  viewModel.favoriteList()[position].isFavorite
                                ],
                                onPressed: (int index) {
                                  viewModel.update(position);
                                },
                                selectedColor: Colors.yellow,
                                children: const [Icon(Icons.favorite)],
                              )
                            ],
                          )
                        ],
                      ));
                })),
      ],
    ));
  }
}
