import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Balancing/balanceModel.dart';
import 'package:flutter_application_1/Models/Balancing/utlity.dart';

class Statistics extends StatefulWidget {
  final int plantId;

  Statistics({Key? key, required this.plantId}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

ValueNotifier kj = ValueNotifier(0);

class _StatisticsState extends State<Statistics> {
  List day = ['ڕۆژ', 'هەفتە', 'مانگ', 'ساڵ'];
  List f = [today(), week(), month(), year()];
  List<BalanceItem> a = [];
  List<FlSpot> spots = [];

  int index_color = 0;

  void sortSpotsByDay(List<FlSpot> spots) {
    spots.sort((a, b) => a.x.compareTo(b.x));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: kj,
          builder: (BuildContext context, dynamic value, Widget? child) {
            a = f[value];
            return custom();
          },
        ),
      ),
    );
  }

  CustomScrollView custom() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'پێداچوونەوە',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 15),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       ...List.generate(
              //         4,
              //         (index) {
              //           return GestureDetector(
              //             onTap: () {
              //               setState(() {
              //                 index_color = index;
              //                 kj.value = index;
              //               });
              //             },
              //             child: Container(
              //               height: 40,
              //               width: 80,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(10),
              //                 color: index_color == index
              //                     ? Color.fromARGB(255, 47, 125, 121)
              //                     : Colors.white,
              //               ),
              //               alignment: Alignment.center,
              //               child: Text(
              //                 day[index],
              //                 style: TextStyle(
              //                   color: index_color == index ? Colors.white : Colors.black,
              //                   fontSize: 16,
              //                   fontWeight: FontWeight.w500,
              //                 ),
              //               ),
              //             ),
              //           );
              //         },
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 20),
              // Chart(
              //   data: [],
              //   indexx: index_color,
              // ),

              Container(
                height: 300,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 5,
                          blurRadius: 6,
                          offset: Offset(0, 4))
                    ]),
                child: LineChart(
                  LineChartData(
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        color: Color.fromARGB(255, 47, 125, 121),
                        isCurved: true,
                        barWidth: 2.5,
                      ),
                    ],
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 22,
                          interval: 1,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              value.toInt().toString(),
                              style: TextStyle(
                                color: Color(0xff68737d),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            );
                          },
                        ),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    lineTouchData: LineTouchData(
                      enabled: true,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'بینینەوەی مامەڵەکان ',
                      style:
                          TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.swap_vert,
                      size: 25,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection('Sales')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data!.docs;
                a = [];
                spots = [];
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final BalanceItem item = BalanceItem.fromSnapshot(data[index]);
                      spots.add(FlSpot(DateTime.parse(item.date).day.toDouble(), item.money));
                      sortSpotsByDay(spots);
                      a.add(item);
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(item.imageURL),
                        ),
                        title: Text(
                          item.name,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          item.date.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Text(
                          '${item.money}\$',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 19,
                            color: item.type == "داهات" ? Colors.green : Colors.red,
                          ),
                        ),
                      );
                    },
                    childCount: data.length,
                  ),
                );
              } else {
                return SliverToBoxAdapter();
              }
            })
      ],
    );
  }
}
