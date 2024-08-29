import 'package:flutter/material.dart';
import 'package:weatherapp/services/api_services.dart';

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
  int dayIndex = -1;

  void getcity() {
    setState(() {
      isReady = true;
    });

    ApiServices().getWeeklyforcast(widget.cityname).then((value) {
      setState(() {
        if (value != null) {
          weekly = value['forecast']['forecastday'];
          if (dayIndex >= 0)
          hourly = weekly[dayIndex]['hour']; // Correctly get hourly data
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
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: isReady
          ? Center(child: CircularProgressIndicator())
          : weekly.isEmpty
          ? Center(child: Text("No data available"))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                DateTime today = DateTime.now();
                DateTime date = today.add(Duration(days: index));
                if (index < weekly.length) {
                  var forecast = weekly[index];
                  var date = forecast["date"];
                  var condition = forecast["day"]["condition"]["text"];
                  var iconlink = forecast["day"]["condition"]["icon"];
                  var temp = forecast["day"]["avgtemp_c"];

                  DateTime dateTime = DateTime.parse(date);
                  String dayName = [
                    "Mon",
                    "Tue",
                    "Wed",
                    "Thu",
                    "Fri",
                    "Sat",
                    "Sun"
                  ][dateTime.weekday - 1];

                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Image.network('https:$iconlink'),
                          title: Text(dayName),
                          subtitle: Text(condition),
                          trailing: Text(
                            '$temp°C',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onTap: () => onDaySelected(index),
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
          Container(
              child: Text("Hourly Forecast",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),

          if (dayIndex >= 0)
          Container(
            height: 500,
            padding: EdgeInsets.all(8.0),

            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hourly.length,
              itemBuilder: (context, index) {
                var forecast = hourly[index];
                var time = forecast["time"];
                var condition = forecast["condition"]["text"];
                var iconlink = forecast["condition"]["icon"];
                var temp = forecast["temp_c"];

                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    width: 120,
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Text(time),
                        SizedBox(height: 10,),
                        Image.network('https:$iconlink', width: 50, height: 50),
                        SizedBox(height: 10,),
                        Text(condition),
                        SizedBox(height: 10,),
                        Text('$temp°C', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
