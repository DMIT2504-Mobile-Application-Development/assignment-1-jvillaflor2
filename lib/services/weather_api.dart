import 'dart:convert';
import 'package:http/http.dart' as http;

const String weatherApiKey = 'c161b0956366f92cad2fd2951b61640b';

const String currentWeatherEndpoint = 'https://api.openweathermap.org/data/2.5/weather';

Future<dynamic> getWeatherForCity({required String city}) async {
  final url = Uri.parse('$currentWeatherEndpoint?units=metric&q=$city&appid=$weatherApiKey');

  try {
    final res = await http.get(url);

    if (res.statusCode != 200) {
      throw Exception('There was a problem with the request: $res received');
    }
    else {
      final data = jsonDecode(res.body);
      return data;
    }
  }
  catch (e) {
    throw Exception ('There was a problem with the request:$e');
  }
}
