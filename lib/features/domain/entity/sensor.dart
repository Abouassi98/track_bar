
enum SensorType {
  radar,
  magneticField,
}

abstract class Sensor {
  SensorType get type;
  String get id;
}

class RadarSensor implements Sensor {

  RadarSensor({required this.id});
  @override
  SensorType get type => SensorType.radar;

  @override
  String id;
}

class MagneticFieldSensor implements Sensor {

  MagneticFieldSensor({required this.id});
  @override
  SensorType get type => SensorType.magneticField;

  @override
  String id;
}
