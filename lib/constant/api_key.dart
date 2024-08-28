// import 'dart:convert';
// import 'package:http/http.dart';
// import 'package:weatherapp/constant/weathermeta.dart';
//
// class ApiServices{
//   Future<List<WeatherMeta>?> getWeatherMeta() async{
//     try{
//       var response = await http.get(Uri.parse("http://api.weatherapi.com/v1/current.json?key=d771530ea2c04342a4a114808240807&q=mumbai"));
//       if(response.statusCode == 200){
//         List<WeatherMeta> model = List<WeatherMeta>.from(json.decode(response.body).map((x)=> WeatherMeta.fromJson(x)));
//         return model;
//       }
//     }catch (e){
//       print(e.toString());
//     }
//     return null;
//   }
// }