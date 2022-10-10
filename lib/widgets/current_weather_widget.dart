import 'package:flutter/material.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget(
      {Key? key,
      required this.city,
      required this.temperature,
      required this.conditionImage,
      required this.weatherMessage,
      required this.windSpeed,
      required this.sunriseHour,
      required this.sunriseMinStr,
      required this.sunsetHour,
      required this.sunsetMinStr})
      : super(key: key);

  final String city;
  final double temperature;
  final String conditionImage;
  final String weatherMessage;
  final double windSpeed;
  final int sunriseHour;
  final String sunriseMinStr;
  final int sunsetHour;
  final String sunsetMinStr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          city ?? '',
          style: const TextStyle(fontSize: 30),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${temperature.round()}°C ',
              style: const TextStyle(fontSize: 96),
            ),
            Image.asset(
              conditionImage,
              height: 64,
            ),
          ],
        ),
        Text(
          weatherMessage,
          style: const TextStyle(fontSize: 24),
        ),
        Text(
          'Wind speed $windSpeed m/s',
          style: const TextStyle(fontSize: 24),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              //'Sunrise: $sunriseHour.$sunriseMin',
              'Sunrise: $sunriseHour.$sunriseMinStr',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              'Sunset: $sunsetHour.$sunsetMinStr',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
