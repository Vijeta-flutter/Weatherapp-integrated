import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weathermodel.dart';

class ApiServices{
  getWeather(String? city) async{
    var url = "http://api.weatherapi.com/v1/current.json?key=d771530ea2c04342a4a114808240807&q=$city";

    var response = await http.get(Uri.parse(url));

    var responseBody = response.body;
    print(responseBody);
    try{
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(json.decode(responseBody));
      }}
    catch(e) {
      throw Exception();
    }
  }


  Future<dynamic> getWeeklyforcast(String cityname) async{
    try {
    var url = "http://api.weatherapi.com/v1/forecast.json?key=d771530ea2c04342a4a114808240807&q=$cityname&days=7";

    var response = await http.get(Uri.parse(url));

    var responseBody = response.body;
    print(responseBody);

      if (response.statusCode == 200) {
        return json.decode(responseBody);
      }}
    catch(e) {
      print(e.toString());
    }
  }
}