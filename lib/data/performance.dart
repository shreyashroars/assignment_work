import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/performance._model.dart';

class PerformData {
  List<Performance> p = [];
  Future<void> getperformance() async {
    var url = Uri.parse(
        'https://api.stockedge.com/Api/SecurityDashboardApi/GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en');
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    jsonData.forEach((element) {
      Performance pm = Performance(
          ChangePercent: element['ChangePercent'],
          ChartPeriodCode: element['ChartPeriodCode'],
          Label: element['Label']);
      p.add(pm);
    });
  }
}
