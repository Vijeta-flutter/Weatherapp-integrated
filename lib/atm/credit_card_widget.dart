import 'package:flutter/material.dart';
import 'package:weatherapp/atm/constants/color_constants.dart';

class CreditCardWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10),
      padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: ColorConstant.cardGradientOne,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(100),
            blurRadius: 6.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Swiss Bank",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: ColorConstant.textColor
          ),
          ),
          SizedBox(height: 40),
          Text("2546 **** **** 7586",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ColorConstant.textColor
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("John Doe",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorConstant.textColor
              ),
              ),
              Icon(
                  Icons.credit_card,
                size: 32,
                color: Colors.white,
              )
            ],
          )
        ],
      ),
    );
  }
}
