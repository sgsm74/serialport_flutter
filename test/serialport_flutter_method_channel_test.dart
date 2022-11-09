import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:serialport_flutter/serialport_flutter_method_channel.dart';

void main() {
  MethodChannelSerialportFlutter platform = MethodChannelSerialportFlutter();
  const MethodChannel channel = MethodChannel('serialport_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
