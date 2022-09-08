import 'networking.dart';
import 'location.dart';
import 'constants.dart';

class Weather {
  Weather({required this.openWeatherMapURL, this.cityName});
  String openWeatherMapURL;
  String? cityName;

  Future<dynamic> getLocationWeather() async {
    NetworkRequest networkRequest;

    if ((cityName == '') || (cityName == null)) {
      final location = Location();
      await location.getCurrentLocation();

      networkRequest = NetworkRequest(
          '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$kWeatherApiKey&units=metric&cnt=$kCnt');
    } else {
      networkRequest = NetworkRequest(
          '$openWeatherMapURL?q=$cityName&appid=$kWeatherApiKey&units=metric&cnt=$kCnt');
    }

    var weatherData = await networkRequest.getData();

    return weatherData;
  }
}
