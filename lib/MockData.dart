import 'package:collection/collection.dart';

class Mockdata {
  final double x; 
  final double y;
  Mockdata({required this.x, required this.y});
}

List<Mockdata> get mockdataHeart {
  final data = <double>[90, 80, 85, 70, 60]; 
  return data.mapIndexed((index,elemenet) => Mockdata(x:index.toDouble(), y: elemenet)).toList();
}

List<Mockdata> get mockdataTemperature {
  final data = <double>[37, 37,2, 36, 35,5, 36]; 
  return data.mapIndexed((index,elemenet) => Mockdata(x:index.toDouble(), y: elemenet)).toList();
}

List<Mockdata> get mockdataHumidity {
  final data = <double>[30, 40,50, 60, 50,30, 30]; 
  return data.mapIndexed((index,elemenet) => Mockdata(x:index.toDouble(), y: elemenet)).toList();
}