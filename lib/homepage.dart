import 'package:flutter/material.dart';
import 'package:weather_forecast/services/weather_data.dart';
import 'package:weather_forecast/constants.dart';
import 'package:weather_forecast/models/current_weather.dart';
import 'package:weather_forecast/models/hour_forecast.dart';
import 'widgets/hour_forecast_item.dart';
import 'widgets/current_weather_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  CurrentWeather? currentWeather;
  HourForecast? hourForecast;
  List<HourForecast> hourForecastList = [];

  dynamic currentWeatherData;
  dynamic forecastWeatherData;
  String cityName = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  void updateUI() async {
    currentWeatherData =
        await WeatherData(url: kCurrentWeatherURL, cityName: cityName)
            .getLocationWeather();
    forecastWeatherData =
        await WeatherData(url: kForecastWeatherURL, cityName: cityName)
            .getLocationWeather();

    setState(() {
      currentWeather = null;
      hourForecastList = [];
      currentWeather = CurrentWeather.fromJson(currentWeatherData);
      hourForecastList = HourForecast.forecastListFromJson(forecastWeatherData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: TextField(
                      onSubmitted: (value) {
                        cityName = value;
                        updateUI();
                      },
                      controller: _controller,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        labelText: 'City name',
                        hintText: 'Enter city name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    // current location weather
                    onPressed: () {
                      setState(() {
                        cityName = '';
                        _controller.clear();
                      });
                      updateUI();
                    },
                    icon: const Icon(Icons.location_on_outlined),
                    iconSize: 48,
                  ),
                ],
              ),
              (hourForecastList.isEmpty)
                  ? const Expanded(
                      child: Center(child: CircularProgressIndicator()))
                  : Column(
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 24,
                            ),
                            CurrentWeatherWidget(
                                currentWeather: currentWeather!),
                            const SizedBox(
                              height: 28,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            if (hourForecastList.isNotEmpty)
                              //TODO: Temporary solution
                              SizedBox(
                                height: MediaQuery.of(context).size.height -
                                    64 -
                                    325,
                                child: ListView.builder(
                                  itemCount: hourForecastList.length,
                                  itemBuilder: (context, index) {
                                    return HourForecastItem(
                                        hourForecast: hourForecastList[index]);
                                  },
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
