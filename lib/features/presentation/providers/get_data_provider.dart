import 'dart:async';

import 'package:sensors_plus/sensors_plus.dart';

import '../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/use_case/get_data_point_uc.dart';
part 'get_data_provider.g.dart';

@riverpod
Stream<MagnetometerEvent> getData(
  GetDataRef ref,
) async* {
  yield* ref.watch(getDataPointUCProvider).call();
}
