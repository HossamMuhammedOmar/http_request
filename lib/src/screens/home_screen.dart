import 'dart:convert';
import 'dart:math';
import '../models/image_model.dart';
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
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Images'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.yellow,
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
    counter++;
    final response =
        await http.get('https://jsonplaceholder.typicode.com/photos/$counter');
    final parsedJson = json.decode(response.body);
    ImageModel imageModel = new ImageModel.fromJson(parsedJson);
    setState(() {
      imageList.add(imageModel.url);
    });
  }
}
