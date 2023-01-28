class CurrentWeather {
  CurrentWeather({
    this.city,
    this.conditionCode,
    this.weatherMessage,
    this.windSpeed,
    this.temperature,
    this.sunriseDateTime,
    this.sunsetDateTime,
  });

  // make a single class and inherit both model classes?

  String? city;
  int? conditionCode;
  String? weatherMessage;
  double? windSpeed;
  double? temperature;
  // String? sunriseDateTime;
  // String? sunsetDateTime;
  DateTime? sunriseDateTime;
  DateTime? sunsetDateTime;

  String get sunriseTimeStr => timeToStr(sunriseDateTime);
  String get sunsetTimeStr => timeToStr(sunsetDateTime);

  String timeToStr(DateTime? dateTime) {
    if (dateTime == null) return '';

    DateTime? localTime = dateTime.toLocal();
    int? hour = localTime.hour ?? 0;
    int? minute = localTime.minute ?? 0;
    String? minuteStr = (minute < 10) ? '0$minute' : '$minute';
    return '$hour:$minuteStr';
  }

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
        city: json['name'],
        conditionCode: json["weather"][0]["id"],
        weatherMessage: json["weather"][0]["description"],
        windSpeed: json["wind"]["speed"],
        temperature: json["main"]["temp"],
        sunriseDateTime:
            DateTime.fromMillisecondsSinceEpoch(json["sys"]["sunrise"] * 1000),
        sunsetDateTime:
            DateTime.fromMillisecondsSinceEpoch(json["sys"]["sunset"] * 1000),
      );
}
