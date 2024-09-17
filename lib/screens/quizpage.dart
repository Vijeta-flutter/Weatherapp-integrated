import 'package:flutter/material.dart';

class QuizMania extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                "Let Play Quiz",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              ),
              Text("Enter your information below",
              style: TextStyle(
                fontSize: 20
              ),
              ),
              TextField(),
              Spacer(),
            ],
          ),
        )
      ),
    );
  }
}
