import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String src;

  const DetailPage(this.src, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.network(
        src,
        loadingBuilder: (context, child, progress) {
          return progress == null ? child : const LinearProgressIndicator();
        },
      ),
    );
  }
}
