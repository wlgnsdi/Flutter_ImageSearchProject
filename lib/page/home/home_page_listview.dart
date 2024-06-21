import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_search_project/shared_data.dart';
import 'package:provider/provider.dart';

import '../detail/detail_page.dart';

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
          debugPrint(
              '>>> Item ${position} - favorite : ${sharedData.list[position].toMap()}');
          debugPrint(
              '>>> Item ${position} - favorite : ${sharedData.list[position].isFavorite}');
          return TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        DetailPage(sharedData.list[position])));
              },
              child: Column(
                children: [
                  Image(
                      image: NetworkImage(
                          sharedData.list[position].getThumbnailImage())),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${sharedData.list[position].displaySitename}'),
                      ToggleButtons(
                        isSelected: [sharedData.list[position].isFavorite],
                        onPressed: (int index) {
                          sharedData.update(position);
                        },
                        selectedColor: Colors.yellow,
                        children: const [Icon(Icons.star)],
                      )
                    ],
                  )
                ],
              ));
        });
  }
}
