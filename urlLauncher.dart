import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://www.google.com';

void main() => runApp(
      const MaterialApp(
        home: Material(
          child: Center(
            //--------put this wrapped comment code under your code-----------//
            child: RaisedButton(
              onPressed: _launchURL,
              child: Text('Show Flutter package'),
              //--------put this wrapped comment code under your code-----------//
            ),
          ),
        ),
      ),
    );
//--------put this wrapped comment code under your code-----------//
void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
//--------put this wrapped comment code under your code-----------//
