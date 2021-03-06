import 'dart:convert';
import '../models/image_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/image_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeSreenState();
  }
}

class HomeSreenState extends State<HomeScreen> {
  final List<ImageModel> imageList = [];
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
      body: ImageList(imageList),
    );
  }

  _getImage() async {
    counter++;
    final response =
        await http.get('https://jsonplaceholder.typicode.com/photos/$counter');
    final parsedJson = json.decode(response.body);
    ImageModel imageModel = ImageModel.fromJson(parsedJson);
    setState(() {
      imageList.add(imageModel);
    });
  }
}
