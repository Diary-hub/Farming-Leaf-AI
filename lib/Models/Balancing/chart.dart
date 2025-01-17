import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Balancing/adddata.dart';
import 'package:flutter_application_1/Models/Balancing/balanceModel.dart';
import 'package:flutter_application_1/Models/Balancing/utlity.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class Chart extends StatefulWidget {
  int indexx;
  Chart({Key? key, required this.indexx, required List<BalanceItem> data}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<BalanceItem>? a;
  bool b = true;
  bool j = true;
  @override
  Widget build(BuildContext context) {
    switch (widget.indexx) {
      case 0:
        a = today();
        b = true;
        j = true;
        break;
      case 1:
        a = week();
        b = false;
        j = true;
        break;
      case 2:
        a = month();
        b = false;
        j = true;
        break;
      case 3:
        a = year();

        j = false;
        break;
      default:
    }
    return Container(
      width: double.infinity,
      height: 300,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <SplineSeries<SalesData, String>>[
          SplineSeries<SalesData, String>(
            color: Color.fromARGB(255, 47, 125, 121),
            width: 3,
            dataSource: <SalesData>[
              SalesData('شەمە', 150),
              SalesData('یەک شەمە', 120),
              SalesData('دوو شەمە', 80),
              SalesData('سێ شەمە', 40),
              SalesData('چوار شەمە', 20),
              SalesData('پێنج شەمە', 10),
              SalesData('هەینی شەمە', 5),
              ...List.generate(time(a!, b ? true : false).length, (index) {
                return SalesData(
                    j
                        ? b
                            ? DateTime.parse(a![index].date).hour.toString()
                            : DateTime.parse(a![index].date).day.toString()
                        : DateTime.parse(a![index].date).month.toString(),
                    b
                        ? index > 0
                            ? time(a!, true)[index] + time(a!, true)[index - 1]
                            : time(a!, true)[index]
                        : index > 0
                            ? time(a!, false)[index] + time(a!, false)[index - 1]
                            : time(a!, false)[index]);
              })
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
          )
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final int sales;
}
