import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../../../core/domain/use_case/use_case_base.dart';
import '../../data/repos/sensor_repo.dart';
import '../repos/i_sensor_repo.dart';
part 'get_data_point_uc.g.dart';

@Riverpod(keepAlive: true)
GetDataPointUseCase getDataPointUC(GetDataPointUCRef ref) {
  return GetDataPointUseCase(sensorRepo: ref.watch(sensorRepoProvider));
}

class GetDataPointUseCase
    implements UseCaseNoParamsBase<Stream<MagnetometerEvent>?> {
  GetDataPointUseCase({required this.sensorRepo});
  final ISensorRepo sensorRepo;

  @override
  Stream<MagnetometerEvent> call() async*{
    yield* sensorRepo.getDataPoint();
  }
}
