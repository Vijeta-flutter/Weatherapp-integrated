import 'package:flutter/material.dart';
import 'package:weatherapp/models/weekmodel.dart';
import 'package:weatherapp/services/api_services.dart';

class Week extends StatefulWidget {
  final String cityname;
  Week({
    required this.cityname
  });

  @override
  State<Week> createState() => _WeekState();
}

class _WeekState extends State<Week> {
  WeeklyModel? weeklyModel;

  @override
  void initState() {
    getcity();
    super.initState();
  }

  void getcity() async{
    var city = await ApiServices().getWeeklyforcast();
    setState(() {
      weeklyModel= city;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cityname,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        children: [
        ListTile(
          leading: Text("SUN"),
          title: Image.network(
            "https:${weeklyModel?.forecast?.forecastday?[1].day?.condition?.icon ?? "Error"}",
          ),
          trailing: Text('${weeklyModel?.forecast?.forecastday?[1].day?.condition?.text ?? "ERROR"}',
            style: TextStyle(fontSize: 16),
          ),
        ),
        ListTile(
          leading: Text("MON"),
          title: Image.network(
            'https:${weeklyModel?.forecast?.forecastday?[1].day?.condition?.icon ?? "Error"}',
          ),
          trailing: Text('${weeklyModel?.forecast?.forecastday?[1].day?.condition?.text ?? "ERROR"}',
            style: TextStyle(fontSize: 16),
          ),
        ),
        ListTile(
          leading: Text("TUE"),
          title: Image.network(
            'https:${weeklyModel?.forecast?.forecastday?[1].day?.condition?.icon ?? "Error"}',
          ),
          trailing: Text('${weeklyModel?.forecast?.forecastday?[1].day?.condition?.text ?? "ERROR"}',
            style: TextStyle(fontSize: 16),
          ),
        ),
        ListTile(
          leading: Text("WED"),
          title: Image.network(
            'https:${weeklyModel?.forecast?.forecastday?[1].day?.condition?.icon ?? "Error"}',
          ),
          trailing: Text('${weeklyModel?.forecast?.forecastday?[1].day?.condition?.text ?? "ERROR"}',
            style: TextStyle(fontSize: 16),
          ),
        ),
        ListTile(
          leading: Text("THU"),
          title: Image.network(
            'https:${weeklyModel?.forecast?.forecastday?[1].day?.condition?.icon ?? "Error"}',
          ),
          trailing: Text('${weeklyModel?.forecast?.forecastday?[1].day?.condition?.text ?? "ERROR"}',
            style: TextStyle(fontSize: 16),
          ),
        ),
        ListTile(
          leading: Text("FRI"),
          title: Image.network(
            'https:${weeklyModel?.forecast?.forecastday?[1].day?.condition?.icon ?? "Error"}',
          ),
          trailing: Text('${weeklyModel?.forecast?.forecastday?[1].day?.condition?.text ?? "ERROR"}',
            style: TextStyle(fontSize: 16),
          ),
        ),
        ListTile(
          leading: Text("SAT"),
          title: Image.network(
            'https:${weeklyModel?.forecast?.forecastday?[1].day?.condition?.icon ?? "Error"}',
          ),
          trailing: Text('${weeklyModel?.forecast?.forecastday?[1].day?.condition?.text ?? "ERROR"}',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
      ),
    );
  }
}

