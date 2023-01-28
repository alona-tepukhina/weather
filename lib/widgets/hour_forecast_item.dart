import 'package:flutter/material.dart';
import 'package:weather_forecast/models/hour_forecast.dart';
import 'package:weather_forecast/constants.dart';

class HourForecastItem extends StatelessWidget {
  const HourForecastItem({Key? key, required this.hourForecast})
      : super(key: key);

  final HourForecast hourForecast;

  // repeats in two classes
  String getConditionImage({required int? id, required int? hour}) {
    if ((id == null) || (hour == null)) return 'images/tornado.png';

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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              hourForecast.weekDay ?? '',
              style: kHfTextStyle,
            ),
            Text(
              '${hourForecast.hour}.00' ?? '',
              style: kHfTextStyle,
            ),
            Image.asset(
              getConditionImage(
                id: hourForecast.conditionCode ?? 0,
                hour: hourForecast.hour,
              ),
              height: 32,
            ),
            Text(
              '${hourForecast.temperature?.round()}°C',
              style: kHfTextStyle,
            ),
            Text(
              '${hourForecast.windSpeed} m/s',
              style: kHfTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
