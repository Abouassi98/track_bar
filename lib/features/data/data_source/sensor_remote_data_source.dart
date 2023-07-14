import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../../../core/presentation/services/connection_stream_service.dart';
part 'sensor_remote_data_source.g.dart';

@Riverpod(keepAlive: true)
SensorRemoteDataSource sensorRemoteDataSource(SensorRemoteDataSourceRef ref) {
  return SensorRemoteDataSource(
    ref,
  );
}

class SensorRemoteDataSource {
  SensorRemoteDataSource(
    this.ref,
  );

  final SensorRemoteDataSourceRef ref;

  (StreamSubscription<MagnetometerEvent>, Stream<MagnetometerEvent>)
      getConnection() => ref.read(setupConnectionProvider);


}
