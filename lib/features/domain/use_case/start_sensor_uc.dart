import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/domain/use_case/use_case_base.dart';
import '../../data/repos/sensor_repo.dart';
import '../repos/i_sensor_repo.dart';

part 'start_sensor_uc.g.dart';

@Riverpod(keepAlive: true)
StartSensorUseCase startSensorUC(StartSensorUCRef ref) {
  return StartSensorUseCase(sensorRepo: ref.watch(sensorRepoProvider));
}

class StartSensorUseCase implements UseCaseNoParamsBase<void> {
  StartSensorUseCase({required this.sensorRepo});
  final ISensorRepo sensorRepo;

  @override
  void call() {
    sensorRepo.start();
    print('afafsafs');
  }
}
