import 'networking.dart';
import 'location.dart';
import '../constants.dart';

class WeatherData {
  WeatherData({required this.url, this.cityName});
  String url;
  String? cityName;

  Future<dynamic> getLocationWeather() async {
    NetworkRequest networkRequest;

    if ((cityName == '') || (cityName == null)) {
      final location = Location();
      await location.getCurrentLocation();

      networkRequest = NetworkRequest(
          '$url?lat=${location.latitude}&lon=${location.longitude}&appid=$kWeatherApiKey&units=metric&cnt=$kCnt');
    } else {
      networkRequest = NetworkRequest(
          '$url?q=$cityName&appid=$kWeatherApiKey&units=metric&cnt=$kCnt');
    }

    var weatherData = await networkRequest.getData();

    return weatherData;
  }
}
