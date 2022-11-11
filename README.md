# serialport_flutter


A Flutter plugin integrated with [Android-SerialPort-API](https://github.com/licheedev/Android-SerialPort-API).

This plugin works only for Android devices.


## Usage

### List devices

``` dart
  List devices = await SerialportFlutter.listDevices();

```
### List devices path

``` dart
  List devices = await SerialportFlutter.listDevicesPath();

```
### Open/Close device

``` dart
bool openResult = await SerialportFlutter.open('/your/device/path', baudrate, dataBits, parity, stopBits);
print(serialPort.isConnected) // true
bool closeResult = await SerialportFlutter.close();
print(serialPort.isConnected) // false
```

### Write data to device

``` dart

SerialportFlutter.write(Uint8List.fromList("Write some data".codeUnits));
```

