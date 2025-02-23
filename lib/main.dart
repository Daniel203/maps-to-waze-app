import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription _intentSub;
  final _sharedFiles = <SharedMediaFile>[];

  @override
  void initState() {
    super.initState();

    // Listen to media sharing coming from outside the app while the app is in the memory.
    _intentSub = ReceiveSharingIntent.instance.getMediaStream().listen((value) {
      setState(() {
        _sharedFiles.clear();
        _sharedFiles.addAll(value);
        processLink();
      });
    }, onError: (err) {});

    // Get the media sharing coming from outside the app while the app is closed.
    ReceiveSharingIntent.instance.getInitialMedia().then((value) {
      setState(() {
        _sharedFiles.clear();
        _sharedFiles.addAll(value);

        // Tell the library that we are done processing the intent.
        ReceiveSharingIntent.instance.reset();

        processLink();
      });
    });
  }

  Future<void> processLink() async {
    if (_sharedFiles.isEmpty) {
      return;
    }

    var link = _sharedFiles.first.path;

    var apiUrl = Uri.parse("http://10.0.2.2:8080/convertLink");

    var response = await http.post(
      apiUrl,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'url': link}),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to convert the link int waze link");
    }

    var url = Uri.parse(response.body);
    print("url: ${url}");

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void dispose() {
    _intentSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const textStyleBold = const TextStyle(fontWeight: FontWeight.bold);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(
          child: Column(
            children: <Widget>[
              Text("Shared files:", style: textStyleBold),
              Text(
                _sharedFiles
                    .map((f) => f.toMap())
                    .join(",\n****************\n"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
