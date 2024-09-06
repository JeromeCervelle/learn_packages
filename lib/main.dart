import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _file;

  Future<void> _pickImage(ImageSource source) async {
    XFile? xFile = await ImagePicker().pickImage(source: source);
    if (xFile != null) {
      setState(() {
        String path = xFile.path;
        _file = File(path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _file != null
                ? Image.file(_file!)
                :FlutterLogo(
                   size: MediaQuery.of(context).size.width * 0.8,
                 ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: (() => _pickImage(ImageSource.camera)),
                    icon: const Icon(FontAwesomeIcons.camera, color: Colors.blue)
                ),
                IconButton(
                    onPressed: (() => _pickImage(ImageSource.gallery)),
                    icon: const Icon(FontAwesomeIcons.photoFilm, color: Colors.blue)
                ),
              ],
            )

          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
