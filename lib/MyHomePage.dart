import 'dart:convert';

import 'package:assinment_new/utils.dart';
import 'package:flutter/material.dart';

import 'model/android_version.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('JSON Parsing and Search'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  displayOutput(context,Utils.input1);
                },
                child: Text('Display Output for Input 1'),
              ),
              ElevatedButton(
                onPressed: () {
                  displayOutput(context,Utils.input2);
                },
                child: Text('Display Output for Input 2'),
              ),
              ElevatedButton(
                onPressed: () {
                  final title = searchByID(4, Utils.input1);
                  displayOutput(context,'Title for ID 4: $title');
                },
                child: Text('Search ID 4 in Input 1'),
              ),
              ElevatedButton(
                onPressed: () {
                  final title = searchByID(8, Utils.input2);
                  displayOutput(context,'Title for ID 8: $title');
                },
                child: Text('Search ID 8 in Input 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void displayOutput(BuildContext context,dynamic jsonData) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Parsed Data'),
          content: Text(jsonEncode(jsonData)),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  String searchByID(int id, List jsonData) {
    for (var item in jsonData) {
      if (item is Map) {
        for (var key in item.keys) {
          if (item[key]['id'] == id) {
            return item[key]['title'];
          }
        }
      }
    }

    return 'Title not found for ID: $id';
  }
}

