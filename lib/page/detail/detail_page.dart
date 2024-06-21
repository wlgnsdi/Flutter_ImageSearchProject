import 'package:flutter/material.dart';
import 'package:image_search_project/domain/image_document.dart';
import 'package:image_search_project/util/my_images.dart';

class DetailPage extends StatelessWidget {
  final ImageDocument imageDocument;

  const DetailPage(this.imageDocument, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Image.network(
        imageDocument.getOriginImage(),
        fit: BoxFit.cover,
        width: double.infinity,
        loadingBuilder: (context, child, progress) {
          return progress == null ? child : const LinearProgressIndicator();
        },
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Image.asset(
            MyImages.defaultImage,
            fit: BoxFit.cover,
            width: double.infinity,
          );
        },
      ),
    );
  }
}
