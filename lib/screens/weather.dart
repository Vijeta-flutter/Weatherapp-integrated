// import 'package:flutter/material.dart';
// import 'package:weatherapp/screens/week.dart';
//
// import 'package:weatherapp/models/weathermodel.dart';
// import 'package:weatherapp/services/api_services.dart';
//
// class Weather extends StatefulWidget {
//   @override
//   State<Weather> createState() => _WeatherState();
// }
//
// class _WeatherState extends State<Weather> {
//   TextEditingController controller = TextEditingController();
//   WeatherModel? weatherMeta;
//
//   @override
//   void initState() {
//     getdata();
//     super.initState();
//   }
//
//   void getdata() async{
//     var data = await ApiServices().getWeather("mumbai");
//     setState(() {
//       weatherMeta = data;
//     });
// }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Weather Page",
//         style: TextStyle(color: Colors.white70),
//         ),
//         backgroundColor: Colors.black54,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//         image: DecorationImage(image: NetworkImage('https://th.bing.com/th/id/OIP.ByNnt97XGAIVh3KA59Vf9AHaED?w=306&h=180&c=7&r=0&o=5&pid=1.7'),
//           fit: BoxFit.cover
//         ),
//       ),
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: ListView(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.5),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: TextField(
//                   controller: controller,
//                   decoration: InputDecoration(
//                     labelText: 'Enter city name',
//                     prefixIcon: Icon(Icons.search),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () async{
//                 WeatherModel fetchedWeatherMeta = await ApiServices().getWeather(controller.text);
//                 setState(() {
//                   weatherMeta = fetchedWeatherMeta;
//                 });
//                 controller.clear();
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white12,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(4)),
//                     minimumSize: Size(MediaQuery.of(context).size.width, 40)
//                 ),
//                 child: Text("Get Weather",
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.white70),
//                 ),
//               ),
//               SizedBox(height: 8),
//               Row(
//                 children: [
//                   Icon(
//                     Icons.push_pin_rounded,
//                     color: Colors.white70,
//                     size: 16,
//                   ),
//                   SizedBox(width: 8),
//                   Text(
//                   "${weatherMeta?.location?.name ?? "ERROR"}, ${weatherMeta?.location?.region ?? "ERROR"}, ${weatherMeta?.location?.country ?? "ERROR"}",
//                   style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.white70,
//                   ),
//                   textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//               Container(
//                 width: 100, height: 150,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     fit: BoxFit.fitHeight,
//                     image: NetworkImage("https:${weatherMeta?.current?.condition?.icon ?? "ERROR"}"),
//                   ),
//                 ),
//               ),
//               // Container(width: 300,height: 300,
//               //   decoration: BoxDecoration(shape: BoxShape.rectangle),
//               //   child: Image.network(
//               //     'https:${weatherMeta?.current?.condition?.icon ?? "ERROR"}',
//               //     fit: BoxFit.fill,
//               //   ),
//               // ),
//               SizedBox(height: 8),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text("Feels like: ${weatherMeta?.current?.feelslikeC ?? "ERROR"}°C",
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.white70,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Container(
//                 padding: EdgeInsets.all(15.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white12,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text("${weatherMeta?.location?.localtime ?? "ERROR"}",
//                     style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white70
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text("${weatherMeta?.current?.tempC ?? "ERROR"}°",
//                     style: TextStyle(
//                       fontSize: 50,
//                       color: Colors.white70,
//                       fontWeight: FontWeight.bold
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text("${weatherMeta?.current?.condition?.text ?? "ERROR"}",
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.white70,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Cloudy: ${weatherMeta?.current?.cloud ?? "ERROR"}%",
//                     style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white70,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     "Humidity: ${weatherMeta?.current?.humidity ?? "ERROR"}%",
//                     style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white70,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     "Wind: ${weatherMeta?.current?.windMph ?? "ERROR"}m/h",
//                     style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white70,
//                     ),
//                   ),
//                 ],),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(onPressed: () {
//                 Navigator.push(context,
//                   MaterialPageRoute(builder:(context) => Week(
//                       cityname: weatherMeta?.location?.name??"ERROR")),
//                 );
//               },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white12,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8)
//                   ),
//                   minimumSize: Size(MediaQuery.of(context).size.width, 40),
//                 ),
//                 child: Text("Next Days",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white70),
//               ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io'; // Import for File
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapp/screens/week.dart';
import 'package:weatherapp/models/weathermodel.dart';
import 'package:weatherapp/services/api_services.dart';
import 'package:weatherapp/widget.dart';

class Weather extends StatefulWidget {
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  TextEditingController controller = TextEditingController();
  WeatherModel? weatherMeta;
  String profilePicPath = ''; // Variable to store the profile picture path

  @override
  void initState() {
    super.initState();
    getdata();
    _loadProfilePic(); // Load profile picture path
  }

  void getdata() async {
    var data = await ApiServices().getWeather("mumbai");
    setState(() {
      weatherMeta = data;
    });
  }

  void _loadProfilePic() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      profilePicPath = prefs.getString('imagePath') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Weather Page",
          style: TextStyle(color: Colors.white70),
        ),
        backgroundColor: Colors.black54,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: RotateContainer(),
            ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://th.bing.com/th/id/OIP.ByNnt97XGAIVh3KA59Vf9AHaED?w=306&h=180&c=7&r=0&o=5&pid=1.7'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: 'Enter city name',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  WeatherModel fetchedWeatherMeta = await ApiServices().getWeather(controller.text);
                  setState(() {
                    weatherMeta = fetchedWeatherMeta;
                  });
                  controller.clear();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  minimumSize: Size(MediaQuery.of(context).size.width, 40),
                ),
                child: Text(
                  "Get Weather",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.push_pin_rounded,
                    color: Colors.white70,
                    size: 16,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "${weatherMeta?.location?.name ?? "ERROR"}, ${weatherMeta?.location?.region ?? "ERROR"}, ${weatherMeta?.location?.country ?? "ERROR"}",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Container(
                width: 100,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage("https:${weatherMeta?.current?.condition?.icon ?? "ERROR"}"),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Feels like: ${weatherMeta?.current?.feelslikeC ?? "ERROR"}°C",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${weatherMeta?.location?.localtime ?? "ERROR"}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "${weatherMeta?.current?.tempC ?? "ERROR"}°",
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "${weatherMeta?.current?.condition?.text ?? "ERROR"}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Cloudy: ${weatherMeta?.current?.cloud ?? "ERROR"}%",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Humidity: ${weatherMeta?.current?.humidity ?? "ERROR"}%",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Wind: ${weatherMeta?.current?.windMph ?? "ERROR"}m/h",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Week(
                        cityname: weatherMeta?.location?.name ?? "ERROR",
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(MediaQuery.of(context).size.width, 40),
                ),
                child: Text(
                  "Next Days",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


