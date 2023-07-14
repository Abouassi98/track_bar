import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'connection_stream_service.g.dart';

enum ConnectionStatus { connected, disconnected }

final _log = Logger('ConnectionLogger');

@riverpod
(StreamSubscription<MagnetometerEvent>, Stream<MagnetometerEvent>)
    setupConnection(SetupConnectionRef ref) {
  final controller = StreamController<MagnetometerEvent>();
  final connectionStatusSubscription = magnetometerEvents.listen(
    (MagnetometerEvent event) {
      _log.fine('MagnetometerEven status changed: $event');

      controller.sink.add(event);

      debugPrint(event.toString());
    },
    onError: (error) {
      controller.sink.close();
      // Logic to handle error
      // Needed for Android in case sensor is not available
    },
    cancelOnError: true,
  );
  // [MagnetometerEvent (x: -23.6, y: 6.2, z: -34.9)]

  ref.onDispose(() {
    controller.close();
    connectionStatusSubscription.cancel();
  });

  return (connectionStatusSubscription, controller.stream.distinct().skip(1));
}
