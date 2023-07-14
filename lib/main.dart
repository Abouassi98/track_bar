import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await <Permission>[
    Permission.location,
    Permission.storage,
    Permission.bluetooth,
    Permission.bluetoothConnect,
    Permission.bluetoothScan,
  ].request().then((status) {
    runApp(const ProviderScope(child: App()));
  });
}
