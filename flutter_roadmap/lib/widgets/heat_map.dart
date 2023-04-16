import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MyHeatMap extends StatelessWidget {
  const MyHeatMap({super.key});

  @override
  Widget build(BuildContext context) {
    return HeatMapCalendar(
      defaultColor: Colors.white,
      flexible: true,
      colorMode: ColorMode.color,
      datasets: {
        DateTime(2023, 4, 6): 3,
        DateTime(2023, 4, 7): 7,
        DateTime(2023, 4, 8): 10,
        DateTime(2023, 4, 9): 13,
        DateTime(2023, 4, 13): 6,
      },
      colorsets: const {
        1: Colors.green,
        3: Colors.orange,
        5: Colors.yellow,
        7: Colors.green,
        9: Colors.blue,
        11: Colors.indigo,
        13: Colors.purple,
      },
    );
  }
}
