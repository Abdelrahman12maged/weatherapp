import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/search.dart';
import 'package:weather/provider/weatherprovider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<weatherprov>(context).weatherdata;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return Search(
                        updateUi: updateUi,
                      );
                    })));
                  },
                  icon: const Icon(Icons.search))
            ],
            title: const Text('Weather App'),
          ),
          body: weatherData == null
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'there is no weather 😔 start',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'searching now 🔍',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      )
                    ],
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      weatherData!.getThemeColor(),
                      weatherData!.getThemeColor()[300]!,
                      weatherData!.getThemeColor()[100]!,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(
                          flex: 3,
                        ),
                        Text(Provider.of<weatherprov>(context).citname!,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                          "updated ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}",
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(weatherData!.getImage()),
                            Text("${weatherData!.temp.toInt()}",
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                )),
                            Column(
                              children: [
                                Text(
                                    "maxTemp  ${weatherData!.maxTemp.toInt()}"),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    "minTemp  ${weatherData!.minTemp.toInt()} ")
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        Text("${weatherData!.weatherStateName.toString()}",
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            )),
                        const Spacer(
                          flex: 3,
                        )
                      ]),
                )),
    );
  }
}
