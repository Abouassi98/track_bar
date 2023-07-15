import 'package:blue_thermal_printer/blue_thermal_printer.dart';

import '../../../core/presentation/utils/riverpod_framework.dart';

part 'bluetooth_provider.g.dart';

@riverpod
Future<List<BluetoothDevice>> bluetoothDevices(
  BluetoothDevicesRef ref,
) async {
  return BlueThermalPrinter.instance.getBondedDevices();
}
