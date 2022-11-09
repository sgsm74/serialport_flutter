import 'package:flutter_test/flutter_test.dart';
import 'package:serialport_flutter/serialport_flutter.dart';
import 'package:serialport_flutter/serialport_flutter_platform_interface.dart';
import 'package:serialport_flutter/serialport_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSerialportFlutterPlatform
    with MockPlatformInterfaceMixin
    implements SerialportFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SerialportFlutterPlatform initialPlatform = SerialportFlutterPlatform.instance;

  test('$MethodChannelSerialportFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSerialportFlutter>());
  });

  test('getPlatformVersion', () async {
    SerialportFlutter serialportFlutterPlugin = SerialportFlutter();
    MockSerialportFlutterPlatform fakePlatform = MockSerialportFlutterPlatform();
    SerialportFlutterPlatform.instance = fakePlatform;

    expect(await serialportFlutterPlugin.getPlatformVersion(), '42');
  });
}
