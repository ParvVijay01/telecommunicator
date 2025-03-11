import 'package:lookme/utils/constants/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartView extends StatefulWidget {
  const PieChartView({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    color: const Color(0xFF972dee),
                  ),
                  const SizedBox(width: 8),
                  Text('First',style: Theme.of(context).textTheme.titleMedium),
                ]
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    color: const Color(0xFF00d584),
                  ),
                  const SizedBox(width: 8),
                  Text('Second',style: Theme.of(context).textTheme.titleMedium),
                ]
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    color: IKColors.primary,
                  ),
                  const SizedBox(width: 8),
                  Text('Third',style: Theme.of(context).textTheme.titleMedium),
                ]
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    color: const Color(0xFFffa644),
                  ),
                  const SizedBox(width: 8),
                  Text('Fourth',style: Theme.of(context).textTheme.titleMedium),
                ]
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xFF972dee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xFF00d584),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: IKColors.primary,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xFFffa644),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}