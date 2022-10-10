import 'package:flutter/material.dart';
import 'package:five_day_weather/constants.dart';

class HourForecastItem extends StatelessWidget {
  const HourForecastItem(
      {Key? key,
      this.hfWeekDayText,
      this.hfTime,
      this.hfConditionImage,
      this.hfTemperature,
      this.hfWindSpeed})
      : super(key: key);

  final hfWeekDayText;
  final hfTime;
  final hfConditionImage;
  final hfTemperature;
  final hfWindSpeed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              hfWeekDayText,
              style: kHfTextStyle,
            ),
            Text(
              '$hfTime.00',
              style: kHfTextStyle,
            ),
            Image.asset(
              hfConditionImage,
              height: 32,
            ),
            Text(
              '${hfTemperature.round()}°C',
              style: kHfTextStyle,
            ),
            Text(
              '$hfWindSpeed m/s',
              style: kHfTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
