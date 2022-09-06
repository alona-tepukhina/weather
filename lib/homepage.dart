import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: const [
                    // Text(
                    //   '02 Sept, Tue',
                    //   style: TextStyle(fontSize: 24),
                    // ),
                    Text(
                      'Odessa',
                      style: TextStyle(fontSize: 32),
                    ),
                    Text(
                      '25°C',
                      style: TextStyle(fontSize: 96),
                    ),
                    Text(
                      'Mostly cloudy/Rain shower',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 48,
                // ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 24),
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      HourForecastItem(),
                      HourForecastItem(),
                      HourForecastItem(),
                      HourForecastItem(),
                      HourForecastItem(),
                      HourForecastItem(),
                      HourForecastItem(),
                      HourForecastItem(),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      DailyForecastItem(),
                      DailyForecastItem(),
                      DailyForecastItem(),
                      DailyForecastItem(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DailyForecastItem extends StatefulWidget {
  const DailyForecastItem({
    super.key,
  });

  @override
  State<DailyForecastItem> createState() => _DailyForecastItemState();
}

class _DailyForecastItemState extends State<DailyForecastItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Card(
        color: Colors.blueGrey[600],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              '02 Sept',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Tue',
              style: TextStyle(fontSize: 16),
            ),
            Icon(
              FontAwesomeIcons.cloudSun,
              size: 32,
            ),
            LimitedBox(
              maxWidth: 80,
              child: Text(
                'Mostly cloudy/Rain shower',
                style: TextStyle(fontSize: 16),
                maxLines: 4,
              ),
            ),
            Text(
              '22°C',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class HourForecastItem extends StatefulWidget {
  const HourForecastItem({
    super.key,
  });

  @override
  State<HourForecastItem> createState() => _HourForecastItemState();
}

class _HourForecastItemState extends State<HourForecastItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            '9.00',
            style: TextStyle(fontSize: 24),
          ),
          Icon(
            FontAwesomeIcons.cloudSunRain,
            size: 64,
          ),
          Text(
            '25°C',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
