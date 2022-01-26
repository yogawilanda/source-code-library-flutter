// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
      PopupMenuButton<String>(  // <-- Static menu dropdown, fit for mobile phone UI
        icon: Icon(Icons.menu),
        onSelected: (String result) {
          switch (result) {
            case 'filter1':
              print('filter 1 clicked');
              break;
            case 'filter2':
              print('filter 2 clicked');
              break;
            case 'clearFilters':
              print('Clear filters');
              break;
            default:
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'filter1',
            child: Text('Filter 1'),
          ),
          const PopupMenuItem<String>(
            value: 'filter2',
            child: Text('Filter 2'),
          ),
          const PopupMenuItem<String>(
            value: 'clearFilters',
            child: Text('Clear filters'),
          ),
        ],
      ),
      PopupMenuButton<String>(
        onSelected: (String result) {
          switch (result) {
            case 'option1':
              print('option 1 clicked');
              break;
            case 'option2':
              print('option 2 clicked');
              break;
            case 'delete':
              print('I want to delete');
              break;
            default:
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'option1',
            child: Text('Option 1'),
          ),
          const PopupMenuItem<String>(
            value: 'option2',
            child: Text('Option 2'),
          ),
          const PopupMenuItem<String>(
            value: 'delete',
            child: Text('Delete'),
          ),
        ],
      )
    ],
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<String>( // <-- Dropdown in a body, can be used too. but use it as it should be.
                items: <String>['A', 'B', 'C', 'D'].map((String value) {
                  return DropdownMenuItem<String>(
                    
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
