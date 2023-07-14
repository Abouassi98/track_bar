import 'dart:async';

import 'package:sensors_plus/sensors_plus.dart';

abstract class ISensorRepo {
  void start();
  void stop();
  Stream<MagnetometerEvent> getDataPoint();
}
