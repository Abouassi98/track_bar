import 'package:sensors_plus/sensors_plus.dart';

enum SensorType {
  radar,
  magneticField,
}

abstract class ISensor {
  SensorType get type;
  MagnetometerEvent get data;
}

class RadarSensor implements ISensor {
  RadarSensor({required this.data});
  @override
  SensorType get type => SensorType.radar;

  @override
  MagnetometerEvent data;
}

class MagneticFieldSensor implements ISensor {
  MagneticFieldSensor({required this.data});
  @override
  SensorType get type => SensorType.magneticField;

  @override
  MagnetometerEvent data;
}
