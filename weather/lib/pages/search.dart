import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/provider/weatherprovider.dart';
import 'package:weather/services/weatherService.dart';

class Search extends StatelessWidget {
  String? cityname;
  Search({this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Search a City")),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) {
                cityname = value;
              },
              onSubmitted: (value) async {
                cityname = value;
                WeatherService service = WeatherService();
                WeatherModel? weather =
                    await service.getWeather(cityname: cityname!);
                Provider.of<weatherprov>(context, listen: false).weatherdata =
                    weather;
                Provider.of<weatherprov>(context, listen: false).citname =
                    cityname;

                Navigator.pop(context);
              },
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  label: const Text("Search"),
                  suffixIcon: GestureDetector(
                      onTap: () async {
                        WeatherService service = WeatherService();
                        WeatherModel? weather =
                            await service.getWeather(cityname: cityname ?? '');
                        Provider.of<weatherprov>(context, listen: false)
                            .weatherdata = weather;
                        Provider.of<weatherprov>(context, listen: false)
                            .citname = cityname;

                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.search)),
                  hintText: "Enter a city",
                  border: const OutlineInputBorder()),
            ),
          ),
        ),
      ),
    );
  }
}
