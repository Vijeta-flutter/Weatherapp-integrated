import 'package:flutter/material.dart';
import 'package:weatherapp/services/api_services.dart';
import 'package:intl/intl.dart';

class Week extends StatefulWidget {
  final String cityname;

  Week({required this.cityname});

  @override
  State<Week> createState() => _WeekState();
}

class _WeekState extends State<Week> {
  bool isReady = false;
  List<dynamic> weekly = [];
  List<dynamic> hourly = [];
  int dayIndex = 0;

  void getcity() {
    setState(() {
      isReady = true;
    });

    ApiServices().getWeeklyforcast(widget.cityname).then((value) {
      setState(() {
        if (value != null) {
          weekly = value['forecast']['forecastday'];

          if (dayIndex >= 0 && dayIndex < weekly.length)
            hourly = weekly[dayIndex]['hour'];
          print('Forecast List: ${weekly.length}');
        }
        isReady = false;
      });
    }).catchError((e) {
      print(e.toString());
      setState(() {
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getcity();
  }

  void onDaySelected(int index) {
    setState(() {
      dayIndex = index;
      hourly = weekly[dayIndex]['hour']; // Fetch hourly data for the selected day
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.cityname,
          style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black38,
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage('https://th.bing.com/th/id/OIP.V4Eyb4JEB10depVvBu1ZhgHaMW?w=768&h=1280&rs=1&pid=ImgDetMain'),
              fit: BoxFit.cover
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: isReady
              ? Center(child: CircularProgressIndicator())
              : weekly.isEmpty
              ? Center(child: Text("No data available"))
              : Column(
            children: [
              SizedBox(height: 20,),
              Container(width: MediaQuery.of(context).size.width,height: 40,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Weekly Forecast Summary",
                        style: TextStyle(fontSize: 20,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: weekly.length,
                  itemBuilder: (context, index) {
                    if (index < weekly.length) {
                      var forecast = weekly[index];
                      var date = forecast["date"];
                      var condition = forecast["day"]["condition"]["text"];
                      var iconlink = forecast["day"]["condition"]["icon"];
                      var temp = forecast["day"]["avgtemp_c"];

                      var sunrise = forecast["astro"]["sunrise"];
                      var sunset = forecast["astro"]["sunset"];

                      DateTime dateTime = DateTime.parse(date).toLocal();
                      DateTime now = DateTime.now().toLocal();
                      DateTime today = DateTime(now.year, now.month, now.day);
                      DateTime tomorrow = today.add(Duration(days: 1));

                      String dayName;
                      if (dateTime.isAtSameMomentAs(today)) {
                        dayName = 'Today';
                      } else if (dateTime.isAtSameMomentAs(tomorrow)) {
                        dayName = 'Tomorrow';
                      } else {
                        dayName = DateFormat('EEEE').format(dateTime); // Full day name
                      }

                      bool isSelected = dayIndex == index;

                      return Card(
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            ListTile(
                              leading: Image.network('https:$iconlink'),
                              title: Text(dayName,textScaleFactor: 1.5,style: TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.bold),),
                              subtitle: Text(condition,style: TextStyle(color: Colors.white70),),
                              trailing: Text(
                                '$temp°C',
                                style: TextStyle(color: Colors.white70,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              onTap: () => onDaySelected(index),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.wb_sunny, color: Colors.orange),
                                      SizedBox(width: 5),
                                      Text('Sunrise: $sunrise',
                                        style: TextStyle(
                                            color: Colors.white70),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.nightlight_round, color: Colors.blue),
                                      SizedBox(width: 5),
                                      Text('Sunset: $sunset',
                                      style: TextStyle(
                                        color: Colors.white70
                                      ),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: Text(
                  "Hourly Forecast Summary",
                  style: TextStyle(fontSize: 22,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold),
                ),
              ),
              if (dayIndex >= 0 && dayIndex < weekly.length)
              Container(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hourly.length,
                  itemBuilder: (context, index) {
                    var forecast = hourly[index];
                    var time = forecast["time"];
                    var condition = forecast["condition"]["text"];
                    var iconlink = forecast["condition"]["icon"];
                    var temp = forecast["temp_c"];
                    var humidity = forecast["humidity"];
                    var cloud = forecast["cloud"];

                    String hourOnly = time.split(' ')[1];

                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 30,horizontal: 2.0),
                      color: Colors.transparent,
                      // color: isSelected ? Colors.black26 : Colors.blueGrey,
                      child: Container(
                        width: 120,
                        padding: EdgeInsets.symmetric(vertical: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 10,),
                            Text(hourOnly,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black87),),
                            SizedBox(height: 10,),
                            Image.network('https:$iconlink', width: 50, height: 50),
                            SizedBox(height: 10,),
                            Text( condition,style: TextStyle(fontSize: 16,color: Colors.white),),
                            SizedBox(height: 10,),
                            Text('$temp°C', style: TextStyle(fontSize: 16,color: Colors.white),
                            ),
                            SizedBox(height: 10,),
                            Text(' Humidity: $humidity%',style: TextStyle(color: Colors.white),),
                            SizedBox(height: 10,),
                            Text('Cloud: $cloud%',style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

