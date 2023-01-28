import 'package:flutter/material.dart';
import 'package:weather_forecast/models/current_weather.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({Key? key, required this.currentWeather})
      : super(key: key);

  final CurrentWeather currentWeather;

  // repeats in two classes
  String getConditionImage({required int id, required int hour}) {
    if (id >= 200 && id < 300) {
      return 'images/rain-thunder.png';
    } else if (id < 600) {
      return 'images/rain.png';
    } else if (id < 700) {
      return 'images/snow.png';
    } else if (id == 701 || id == 741) {
      return 'images/mist-tmp.png';
    } else if (id == 800) {
      return (hour >= 6 && hour <= 18) ? 'images/sun.png' : 'images/moon.png';
    } else if (id >= 801 && id <= 803) {
      return (hour >= 6 && hour <= 18)
          ? 'images/clouds-sun.png'
          : 'images/clouds-moon.png';
    } else if (id == 804) {
      return 'images/clouds.png';
    } else {
      return 'images/tornado.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          currentWeather.city ?? '',
          style: const TextStyle(fontSize: 30),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${currentWeather.temperature?.round()}°C ',
              style: const TextStyle(fontSize: 96),
            ),
            Image.asset(
              getConditionImage(
                  id: currentWeather.conditionCode ?? 0,
                  hour: DateTime.now().toLocal().hour),
              height: 64,
            ),
          ],
        ),
        Text(
          currentWeather.weatherMessage ?? '',
          style: const TextStyle(fontSize: 24),
        ),
        Text(
          'Wind speed ${currentWeather.windSpeed} m/s',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sunrise: ${currentWeather.sunriseTimeStr}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              'Sunset: ${currentWeather.sunsetTimeStr}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
