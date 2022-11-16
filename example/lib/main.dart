import 'package:bitmap/bitmap.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:serialport_flutter/serialport_flutter.dart';
import 'package:serialport_flutter_example/sds.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List _devices = ['hi'];
  final _serialportFlutterPlugin = SerialportFlutter();
  final bmp = Bitmap.fromHeadless(500, 500, Uint8List.fromList(data1));

  @override
  void initState() {
    getDevices();
    super.initState();
  }

  @override
  void dispose() async {
    await _serialportFlutterPlugin.close();
    super.dispose();
  }

  Future<void> getDevices() async {
    List? devices;
    try {
      devices = (await _serialportFlutterPlugin.getAllDevicesPath());
    } on PlatformException {
      devices = [];
    }
    if (!mounted) return;

    setState(() {
      _devices = devices!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Scrollbar(
                child: ListView(
                  children: [
                    // for (final device in _devices)
                    //   Builder(builder: (context) {
                    //     return Text(device);
                    //   }),
                    // SizedBox(
                    //   height: 500,
                    //   child: Image.memory(Uint8List.fromList(data1)),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardListTile extends StatelessWidget {
  const CardListTile({super.key, required this.name, required this.value});

  final String name;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(value ?? 'N/A'),
        subtitle: Text(name),
      ),
    );
  }
}
