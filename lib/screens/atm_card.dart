import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  // final ValueNotifier<bool> _isSlidingUp = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Virtual Card'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          height: 200,
          child: Stack(
            children: [
              _buildCard(),
              _buildAnimatedBookmark(),
              // _buildTapDetector(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'UFO NAME',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              Text(
                '1234 5678 9012 3456',
                style: TextStyle(
                  fontSize: 24,
                  letterSpacing: 2.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ALICE',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '12/26',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedBookmark() {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 100, end: 40),
      duration: Duration(seconds: 3),
      builder: (context, value, child) {
        return Positioned(
          left: 250,
          child: RotatedBox(
            quarterTurns: 3,
            child: AnimatedContainer(
              duration: Duration(seconds: 3),
              height: 60,
              width: value,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  Expanded(
                    child: AnimatedOpacity(
                      opacity: value == 100 ? 0.0 : 1.0,
                      duration: Duration(milliseconds: 300),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "hellllo",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white70),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

  // Widget _buildTapDetector(){
  //   return Positioned.fill(
  //     child: GestureDetector(
  //       onTap: () {
  //         if (!_isSlidingUp.value) {
  //           _isSlidingUp.value = true;
  //         }
  //       },
  //       child: Container(
  //         color: Colors.transparent,
  //       ),
  //     ),
  //   );
  // }

