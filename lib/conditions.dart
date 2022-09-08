// class Condition {
//
//   Condition({required this.id, required this.hour});
//   int id;
//   int hour;
//
String getConditionImage(int id, int hour) {
  if (id >= 200 && id > 300) {
    return 'images/rain-thunder.png';
  } else if (id < 600) {
    return 'images/rain.png';
  } else if (id < 700) {
    return 'images/snow.png';
  } else if (id == 701 || id == 741) {
    return 'images/mist-tmp';
  } else if (id == 800) {
    return (hour >= 6 && hour <= 18) ? 'images/sun.png' : 'images.moon.png';
  } else if (id >= 801 && id <= 803) {
    return (hour >= 6 && hour <= 18)
        ? 'images/clouds-sun.png'
        : 'images.clouds-moon.png';
  } else if (id == 804) {
    return 'images/clouds.png';
  } else {
    return 'tornado.png';
  }
}

//}
