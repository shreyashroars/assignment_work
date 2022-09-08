import 'package:assignment_work/model/performance._model.dart';
import 'package:flutter/material.dart';

class PerfWidget extends StatelessWidget {
  late List<Performance> pr;
  PerfWidget(this.pr);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) => ListViewTile(
              ChangePercent: pr[index].ChangePercent,
              ChartPeriodCode: pr[index].ChartPeriodCode,
              Label: pr[index].Label),
          itemCount: pr.length),
    );
  }
}

class ListViewTile extends StatelessWidget {
  final String? Label, ChartPeriodCode;
  final double? ChangePercent;
  ListViewTile({this.ChangePercent, this.ChartPeriodCode, this.Label});
  double getbarWidth(double? ChangePercent, double w) {
    double ch;
    if (ChangePercent == null)
      return 0;
    else {
      if (ChangePercent < 0.0)
        ch = (-1 * ChangePercent);
      else if (ChangePercent > 300)
        ch = w - 3.8;
      else
        ch = ChangePercent;
      return ch;
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width * 0.5;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Container(width: 60, child: Text(Label!)),
              SizedBox(
                width: 10,
              ),
              Stack(children: [
                Container(
                  height: 30,
                  width: w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                Container(
                    height: 30,
                    // color: Colors.white,
                    padding: EdgeInsets.all(2),
                    child: Container(
                      height: 30,
                      width: getbarWidth(ChangePercent, w),
                      decoration: BoxDecoration(
                        color: ChangePercent! < 0
                            ? Colors.red
                            : Color.fromARGB(255, 13, 221, 120),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ))
              ]),
              SizedBox(
                width: 10,
              ),
              Container(
                child: ChangePercent! > 0.0
                    ? ImageIcon(
                        AssetImage('assets/up.png'),
                        color: Colors.green,
                        size: 9,
                      )
                    : ImageIcon(
                        AssetImage('assets/down4.png'),
                        color: Colors.red,
                        size: 9,
                      ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                ChangePercent!.toStringAsFixed(2) + '%',
                style: TextStyle(
                    color: ChangePercent! < 0 ? Colors.red : Colors.green),
              )
            ],
          ),
        ),
        SizedBox(height: 10)
      ],
    );
  }
}
