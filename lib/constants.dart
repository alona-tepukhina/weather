import 'package:flutter/material.dart';

// Enter your API key here
const kWeatherApiKey = '8af084123299ddac16c7c8117b9fb416';
const kForecastWeatherURL = 'https://api.openweathermap.org/data/2.5/forecast';
const kCurrentWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

// cnt - a  number of timestamps, which will be returned in the API response
// 8 timestamps per 24 hours, max 40

const kCnt = 16;

const kHfTextStyle = TextStyle(fontSize: 16);
