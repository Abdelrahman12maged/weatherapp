import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherService {
  String baseurl = 'http://api.weatherapi.com/v1';

  String apikey = '89d39870c88d40efaa6222925222912';

  Future<WeatherModel?> getWeather({required String cityname}) async {
    WeatherModel? weather;
    try {
      Uri url =
          Uri.parse('$baseurl/forecast.json?key=$apikey&q=$cityname&days=7');
      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);

      weather = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
