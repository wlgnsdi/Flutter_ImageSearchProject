import 'package:flutter/material.dart';
import 'package:image_search_project/page/home/home_page_listview.dart';
import 'package:image_search_project/shared_data.dart';
import 'package:image_search_project/util/utils.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    SharedDataModel sharedData = Provider.of<SharedDataModel>(context);

    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: '검색어를 입력하세요',
                    border: OutlineInputBorder(),
                    // suffixIcon: Icon(Icons.search),
                  ),
                  controller: textEditingController,
                ),
              ),
              TextButton(
                onPressed: () {
                  if (textEditingController.text.trim().isNotEmpty) {
                    hideKeyboard();
                    sharedData.searchImage(textEditingController.text);
                  }
                },
                child: const Text('검색'),
              )
            ],
          ),
          sharedData.list.isNotEmpty
              ? const Expanded(child: HomePageListView())
              : const Expanded(child: Center(child: Text('검색하세요.')))
        ],
      ),
    );
  }
}
