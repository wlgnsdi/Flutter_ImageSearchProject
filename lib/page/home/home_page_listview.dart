import 'package:flutter/material.dart';
import 'package:image_search_project/shared_data.dart';
import 'package:image_search_project/util/my_images.dart';
import 'package:image_search_project/util/navigator_route_name.dart';
import 'package:provider/provider.dart';

class HomePageListView extends StatelessWidget {
  const HomePageListView({super.key});

  @override
  Widget build(BuildContext context) {
    SharedDataModel sharedData = Provider.of<SharedDataModel>(context);

    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: sharedData.list.length,
      itemBuilder: (context, position) {
        return TextButton(
          onPressed: () {
            Navigator.pushNamed(context, routePageDetail,
                arguments: sharedData.list[position]);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FadeInImage.assetNetwork(
                width: 100,
                height: 100,
                placeholder: MyImages.defaultImage,
                image: sharedData.list[position].getThumbnailImage(),
                fadeInDuration: const Duration(milliseconds: 300),
                  imageErrorBuilder: (_, __, ___) {
                    return Image.asset(MyImages.defaultImage);
                  }
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${sharedData.list[position].collection}'),
                    Text('${sharedData.list[position].displaySitename}'),
                    ToggleButtons(
                      constraints: const BoxConstraints(
                        minHeight: 25,
                        minWidth: 25,
                      ),
                      isSelected: [sharedData.list[position].isFavorite],
                      onPressed: (int index) {
                        sharedData.update(position);
                      },
                      selectedColor: Colors.yellow,
                      children: const [
                        Icon(
                          Icons.star,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
