import 'package:flutter/foundation.dart';

import 'serialport_flutter_platform_interface.dart';

class SerialportFlutter {
  Future<String?> getPlatformVersion() {
    return SerialportFlutterPlatform.instance.getPlatformVersion();
  }

  Future<List?> getAllDevices() {
    return SerialportFlutterPlatform.instance.getAllDevices();
  }

  Future<List?> getAllDevicesPath() {
    return SerialportFlutterPlatform.instance.getAllDevicesPath();
  }

  Future<bool?> open(
      String filePath, int baudrate, int dataBits, int parity, int stopBits) {
    return SerialportFlutterPlatform.instance
        .open(filePath, baudrate, dataBits, parity, stopBits);
  }

  Future<bool?> write(Uint8List data) {
    return SerialportFlutterPlatform.instance.write(data);
  }

  Future<bool?> close() {
    return SerialportFlutterPlatform.instance.close();
  }
}
