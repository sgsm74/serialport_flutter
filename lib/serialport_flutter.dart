import 'package:flutter/foundation.dart';

import 'serialport_flutter_platform_interface.dart';

class SerialportFlutter {
  Future<String?> getPlatformVersion() {
    return SerialportFlutterPlatform.instance.getPlatformVersion();
  }

  Future<List<String>?> getAllDevices() {
    return SerialportFlutterPlatform.instance.getAllDevices();
  }

  Future<bool?> open(String filePath, int baudrate) {
    return SerialportFlutterPlatform.instance.open(filePath, baudrate);
  }

  Future<bool?> write(Uint8List data) {
    return SerialportFlutterPlatform.instance.write(data);
  }
}
