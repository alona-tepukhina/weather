class HourForecast {
  HourForecast({
    this.dateTime,
    this.conditionCode,
    this.weatherMessage,
    this.windSpeed,
    this.temperature,
  });

  DateTime? dateTime;
  int? conditionCode;
  String? weatherMessage;
  double? windSpeed;
  double? temperature;

  List<HourForecast> hourForecastList = [];

  // make a single class and inherit both model classes?

  Map<int, String> weekdayName = {
    1: "Mon",
    2: "Tue",
    3: "Wed",
    4: "Thu",
    5: "Fri",
    6: "Sat",
    7: "Sun"
  };

  String? get weekDay {
    if ((dateTime == null) || (dateTime?.weekday == null)) {
      return '';
    } else {
      if (dateTime?.weekday == DateTime.now().weekday) {
        return 'Today';
      } else {
        return weekdayName[dateTime?.weekday];
      }
    }
  }

  int? get hour => dateTime?.hour;

  static List<HourForecast> forecastListFromJson(Map<String, dynamic> json) {
    List<HourForecast> tmp = [];
    for (var element in json['list']) {
      tmp.add(HourForecast(
        dateTime: DateTime.parse(element["dt_txt"]).toLocal(),
        conditionCode: element["weather"][0]["id"],
        weatherMessage: element["weather"][0]["description"],
        windSpeed: element["wind"]["speed"],
        temperature: element["main"]["temp"],
      ));
    }
    return tmp;
  }
}
