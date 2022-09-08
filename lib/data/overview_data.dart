import 'package:assignment_work/model/overview_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OverviewData {
  Overview overV = Overview();
  Future<void> getOverview() async {
    var url = Uri.parse(
        'https://api.stockedge.com/Api/SecurityDashboardApi/GetCompanyEquityInfoForSecurity/5051?lang=en');

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    Overview ov = Overview(
        BookNavPerShare: jsonData['BookNavPerShare'],
        EV: jsonData['EV'],
        Industry: jsonData['Industry'],
        MarketCap: jsonData['MCAP'],
        PEGRatio: jsonData['PEGRatio'],
        Sector: jsonData['Sector'],
        Yield: jsonData['Yield'],
        TTMPE: jsonData['TTMPE']);
    overV = ov;
  }
}
