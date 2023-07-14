import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sensors_plus/sensors_plus.dart';
import '../../domain/repos/i_sensor_repo.dart';
import '../data_source/sensor_remote_data_source.dart';
part 'sensor_repo.g.dart';

@Riverpod(keepAlive: true)
ISensorRepo sensorRepo(SensorRepoRef ref) {
  return SensorRepoImpl(
    remoteDataSource: ref.watch(sensorRemoteDataSourceProvider),
  );
}

class SensorRepoImpl implements ISensorRepo {
  SensorRepoImpl({required this.remoteDataSource});
  final SensorRemoteDataSource remoteDataSource;

  @override
  void start() {
    remoteDataSource.getConnection().$1.resume();
  }

  @override
  void stop() {
    remoteDataSource.getConnection().$1.pause();

    // Implement stop measurement logic for Magnetic Field Sensor
  }

  @override
  Stream<MagnetometerEvent> getDataPoint() async* {
    yield* remoteDataSource.getConnection().$2;
    // Implement data transfer logic for Magnetic Field Sensor
  }
}
