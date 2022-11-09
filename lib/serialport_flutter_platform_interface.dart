import 'package:flutter/foundation.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'serialport_flutter_method_channel.dart';

abstract class SerialportFlutterPlatform extends PlatformInterface {
  /// Constructs a SerialportFlutterPlatform.
  SerialportFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static SerialportFlutterPlatform _instance = MethodChannelSerialportFlutter();

  /// The default instance of [SerialportFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelSerialportFlutter].
  static SerialportFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SerialportFlutterPlatform] when
  /// they register themselves.
  static set instance(SerialportFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<List<String>?> getAllDevices() {
    throw UnimplementedError('getAllDevices() has not been implemented.');
  }

  Future<List<String>?> getAllDevicesPath() {
    throw UnimplementedError('getAllDevicesPath() has not been implemented.');
  }

  Future<bool?> open(String filePath, int baudrate) {
    throw UnimplementedError('open() has not been implemented.');
  }

  Future<bool?> write(Uint8List data) {
    throw UnimplementedError('write() has not been implemented.');
  }
}
