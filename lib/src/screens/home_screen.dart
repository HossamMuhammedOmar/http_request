import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeSreenState();
  }
}

class HomeSreenState extends State<HomeScreen> {
  final List<String> imageList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Images'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
      ),
      body: Center(
        child: Container(
          child: ListView.builder(
            itemCount: imageList.length,
            itemBuilder: (BuildContext context, int index) {
              return _addImage(imageList[index]);
            },
          ),
        ),
      ),
    );
  }

  Widget _addImage(String image) {
    return Image.network(image);
  }

  _getImage() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/photos/1');
    final parsedJson = json.decode(response.body);
  }
}
