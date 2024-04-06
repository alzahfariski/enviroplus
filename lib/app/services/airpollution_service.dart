import 'dart:convert';

import 'package:enviroplus/app/models/airpollution_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AirService {
  String baseUrl = "https://enviro-api-nu.vercel.app/api/v1";

  Future<PolusiUdara> getAir() async {
    String lat = '-6.1754083';
    String lon = '106.824584';
    var url = '$baseUrl/open_weather/air_pollution?lat=$lat&lon=$lon';
    final box = GetStorage();
    String token = box.read('usertoken');
    var headers = {'Authorization': token};

    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body)['data'];
      PolusiUdara air = PolusiUdara.fromJson(data);
      return air;
    } else {
      throw Exception('Gagal get air pollution');
    }
  }
}
