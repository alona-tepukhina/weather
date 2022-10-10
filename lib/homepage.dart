import 'package:flutter/material.dart';
import 'services/weather.dart';
import 'constants.dart';
import 'widgets/hour_forecast_item.dart';
import 'widgets/current_weather_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  // current weather variables

  String cityName = '';

  String? city;
  double temperature = 0;
  double windSpeed = -1;
  int conditionId = 0;
  String conditionImage = 'images/tornado.png';
  String weatherMessage = 'Unable to get weather data';
  DateTime? sunriseDateTime;
  int sunriseHour = -1;
  int sunriseMin = -1;
  String sunriseMinStr = '';
  DateTime? sunsetDateTime;
  int sunsetHour = -1;
  int sunsetMin = -1;
  String sunsetMinStr = '';

  Widget currentWeatherWidget = Container();

  // hour forecast (hf) variables

  List<Widget> hfItems = [];
  String hfDateTimeString = '';
  int hfTime = -1;
  int hfDay = -1;
  int hfWeekDay = 0;
  double hfTemperature = 0;
  double hfWindSpeed = 0;
  int hfConditionId = 0;
  String hfConditionImage = 'images/tornado.png';
  String hfWeatherMessage = '';
  String hfWeekDayText = '';

  Map<int, String> hfWeekdayName = {
    1: "Mon",
    2: "Tue",
    3: "Wed",
    4: "Thu",
    5: "Fri",
    6: "Sat",
    7: "Sun"
  };

  // make as mixin ???
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
    Weather currentWeather = Weather(
        openWeatherMapURL: kOpenWeatherMapCurrentURL, cityName: cityName);
    Weather forecastWeather = Weather(
        openWeatherMapURL: kOpenWeatherMapForecastURL, cityName: cityName);

    final currentWeatherData = await currentWeather.getLocationWeather();
    final forecastWeatherData = await forecastWeather.getLocationWeather();
    //print(weatherData);

    setState(() {
      // current weather

      var time = DateTime.now();

      city = currentWeatherData["name"];
      temperature = currentWeatherData["main"]["temp"];
      windSpeed = currentWeatherData["wind"]["speed"];
      conditionId = currentWeatherData["weather"][0]["id"];
      conditionImage = getConditionImage(id: conditionId, hour: time.hour);
      weatherMessage = currentWeatherData["weather"][0]["description"];

      sunriseDateTime = DateTime.fromMillisecondsSinceEpoch(
          currentWeatherData["sys"]["sunrise"] * 1000);
      sunriseHour = sunriseDateTime?.hour ?? 0;
      sunriseMin = sunriseDateTime?.minute ?? 0;
      sunriseMinStr = (sunriseMin < 10) ? '0$sunriseMin' : '$sunriseMin';

      sunsetDateTime = DateTime.fromMillisecondsSinceEpoch(
          currentWeatherData["sys"]["sunset"] * 1000);
      sunsetHour = sunsetDateTime?.hour ?? 0;
      sunsetMin = sunsetDateTime?.minute ?? 0;
      sunsetMinStr = (sunsetMin < 10) ? '0$sunsetMin' : '$sunsetMin';

      currentWeatherWidget = CurrentWeatherWidget(
        city: city!,
        temperature: temperature,
        conditionImage: conditionImage,
        weatherMessage: weatherMessage,
        windSpeed: windSpeed,
        sunriseHour: sunriseHour,
        sunriseMinStr: sunriseMinStr,
        sunsetHour: sunsetHour,
        sunsetMinStr: sunsetMinStr,
      );

      // hour forecast

      hfItems = [];

      for (int i = 0; i < kCnt; i++) {
        hfDateTimeString = forecastWeatherData["list"][i]["dt_txt"];
        hfTime = 3 + (DateTime.parse(hfDateTimeString).hour);
        //hfTime = (DateTime.parse(hfDateTimeString).toLocal().hour);

        hfDay = (DateTime.parse(hfDateTimeString).day);
        hfWeekDay = (DateTime.parse(hfDateTimeString).weekday);

        hfTemperature = forecastWeatherData["list"][i]["main"]["temp"];
        hfWindSpeed = forecastWeatherData["list"][i]["wind"]["speed"];
        hfConditionId = forecastWeatherData["list"][i]["weather"][0]["id"];
        hfConditionImage = getConditionImage(id: hfConditionId, hour: hfTime);

        hfWeekDayText =
            ((hfDay == time.day) ? 'Today' : hfWeekdayName[hfWeekDay]!);

        hfItems.add((HourForecastItem(
            hfWeekDayText: hfWeekDayText,
            hfTime: hfTime,
            hfConditionImage: hfConditionImage,
            hfTemperature: hfTemperature,
            hfWindSpeed: hfWindSpeed)));
      }
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
                      //autofocus: true,
                      onSubmitted: (value) {
                        cityName = value;
                        //print(cityName);
                        updateUI();
                      },
                      controller: _controller,
                      decoration: const InputDecoration(
                        //prefixIcon: Icon(Icons.search),
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
              const SizedBox(
                height: 24,
              ),
              currentWeatherWidget,
              const SizedBox(
                height: 28,
              ),
              Expanded(
                child:
                    ListView(scrollDirection: Axis.vertical, children: hfItems),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
