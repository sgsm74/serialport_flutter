import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'serialport_flutter_platform_interface.dart';

/// An implementation of [SerialportFlutterPlatform] that uses method channels.
class MethodChannelSerialportFlutter extends SerialportFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('serialport_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<List?> getAllDevices() async {
    final devices = await methodChannel.invokeMethod<List>('getAllDevices');
    return devices;
  }

  @override
  Future<List?> getAllDevicesPath() async {
    final devicesPath =
        await methodChannel.invokeMethod<List>('getAllDevicesPath');
    return devicesPath;
  }

  @override
  Future<bool?> open(String filePath, int baudrate, int dataBits, int parity,
      int stopBits) async {
    final result = await methodChannel.invokeMethod<bool>('open', {
      "devicePath": filePath,
      "baudrate": baudrate,
      "dataBits": dataBits,
      "parity": parity,
      "stopBits": stopBits
    });
    return result;
  }

  @override
  Future<bool?> write(Uint8List data) async {
    final result =
        await methodChannel.invokeMethod<bool>('write', {"data": data});
    return result;
  }

  @override
  Future<bool?> close() async {
    final result = await methodChannel.invokeMethod<bool>('close');
    return result;
  }
}
