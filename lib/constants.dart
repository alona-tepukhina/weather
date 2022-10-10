import 'package:flutter/material.dart';

const kWeatherApiKey = '8af084123299ddac16c7c8117b9fb416';
const kOpenWeatherMapForecastURL =
    'https://api.openweathermap.org/data/2.5/forecast';
const kOpenWeatherMapCurrentURL =
    'https://api.openweathermap.org/data/2.5/weather';

// cnt - a  number of timestamps, which will be returned in the API response
// 8 timestamps per 24 hours

const kCnt = 12;

const kHfTextStyle = TextStyle(fontSize: 16);
