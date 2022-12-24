import 'package:flutter/material.dart';
import 'package:native_opencv/native_opencv.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'CPP flutter binding demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final nativeOpencv = NativeOpenCV(); // Define nativeOpencv here

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _opencvVersion = ''; // Initialize OpenCV version string to empty

  void _getOpenCVVersion() {
    setState(() {
      _opencvVersion = widget.nativeOpencv.cvVersion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Show OpenCV Version:',
              ),
              // add text button
              TextButton(
                child: Text('tap'),
                onPressed: _getOpenCVVersion,
              ),
              // add text widget to display OpenCV version
              Text(_opencvVersion),
            ],
          ),
        ));
  }
}
