import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothService {
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  BluetoothDevice? targetDevice;
  BluetoothCharacteristic? targetCharacteristic;

  // Start scanning for Bluetooth devices
  void startScan(void Function(BluetoothDevice) onDeviceFound) {
    flutterBlue.startScan(timeout: const Duration(seconds: 4));

    flutterBlue.scanResults.listen((results) {
      for (final result in results) {
        onDeviceFound(result.device);
      }
    });
  }

  // Connect to a Bluetooth device
  Future<void> connectToDevice() async {
    await targetDevice?.connect();
  }

  // Discover services and characteristics
  Future<void> discoverServicesAndCharacteristics() async {
    final services = await targetDevice?.discoverServices() ?? [];

    for (final service in services) {
      final characteristics = service.characteristics;

      for (final characteristic in characteristics) {
        if (characteristic.uuid == targetCharacteristic?.uuid) {
          targetCharacteristic = characteristic;
        }
      }
    }
  }

  // Read data from the sensor
  Future<List<int>> readSensorData() async {
    if (targetCharacteristic != null) {
      final value = await targetCharacteristic?.read() ?? [];
      return value;
    } else {
      throw Exception('Target characteristic not found.');
    }
  }

  // Disconnect from the device
  void disconnectDevice() {
    if (targetDevice != null) {
      targetDevice?.disconnect();
      targetCharacteristic = null;
    }
  }
}
