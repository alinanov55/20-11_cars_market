import 'package:flutter/material.dart';


class ProductDetailsPage extends StatelessWidget{
  final String ImageContent;
  final String TextContent;

  ProductDetailsPage({required this.ImageContent, required this.TextContent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextContent),
      ),
      body: Column(
        children: [
          Image.network(ImageContent),
          Text(TextContent),
        ],
      ),
    );
  }
}