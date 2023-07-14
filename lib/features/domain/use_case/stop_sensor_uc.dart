import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/domain/use_case/use_case_base.dart';
import '../../data/repos/sensor_repo.dart';
import '../repos/i_sensor_repo.dart';
part 'stop_sensor_uc.g.dart';

@riverpod
StopSensorUseCase stopSensorUC(StopSensorUCRef ref) {
  return StopSensorUseCase(sensorRepo: ref.watch(sensorRepoProvider));
}

class StopSensorUseCase implements UseCaseNoParamsBase<void> {
  StopSensorUseCase({required this.sensorRepo});
  final ISensorRepo sensorRepo;

  @override
  void call() {
    sensorRepo.stop();
    print('sddssd');
  }
}
