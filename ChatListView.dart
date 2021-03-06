import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(,
      title: 'List Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF6200EE),
      ),
      home: ListDemo(),
    );
  }
}

class ListDemo extends StatefulWidget {
  @override
  _ListDemoState createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
  // int groupValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('whatsapp'),
        backgroundColor: Colors.green[600],
        actions: [
          //TODO: Add functional button to the Icon, and change it to the correct Icon
          Icon(Icons.contacts),
          Icon(Icons.bookmarks),
        ],
      ),
      body: ListView(
        children: [
          for (int count in List.generate(16, (index) => index + 1))
            ListTile(
              title: Text('List item $count'),
              subtitle: Text('Secondary text'),
              //To create a circular avatar shape on the listView
              leading: CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.blue,
              ),
            ),
          
        ],
      ),
    );
  }
}
