import 'package:assignment_work/data/overview_data.dart';
import 'package:assignment_work/data/performance.dart';
import 'package:assignment_work/model/overview_model.dart';
import 'package:assignment_work/model/performance._model.dart';
import 'package:assignment_work/widgets/companyEquity.dart';
import 'package:assignment_work/widgets/performance_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading = true;
  Overview o = Overview();
  List<Performance> pr = [];
  @override
  void initState() {
    getOverviewRep();
    getPerformanceRep();
    super.initState();
  }

  getOverviewRep() async {
    OverviewData overviewData = OverviewData();
    await overviewData.getOverview();
    o = overviewData.overV;
    setState(() {
      _loading = false;
    });
  }

  getPerformanceRep() async {
    PerformData pe = PerformData();
    await pe.getperformance();
    pr = pe.p;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 233, 168),
      appBar: AppBar(
          title: Text(
        'Assignment',
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      body: _loading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Overview',
                        style: GoogleFonts.arvo(
                            textStyle: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey),
                  CompEquityInf(o),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Performance',
                        style: GoogleFonts.arvo(
                            textStyle: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey),
                  PerfWidget(pr),
                ],
              ),
            ),
    );
  }
}
