import 'package:flutter/cupertino.dart';
import 'package:weather/models/weather_model.dart';

class weatherprov extends ChangeNotifier {
  WeatherModel? _weatherdata;
  String? citname;
  set weatherdata(WeatherModel? weather) {
    _weatherdata = weather;

    notifyListeners();
  }

  WeatherModel? get weatherdata => _weatherdata;
}
