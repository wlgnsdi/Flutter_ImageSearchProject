import 'package:flutter/material.dart';
import 'package:image_search_project/page/home/home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(onPressed: () async {
        viewModel.searchImage();
      }, child: Text('Image'),),
    );
  }
}
