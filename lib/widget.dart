import 'package:flutter/material.dart';
import 'dart:math';

import 'package:weatherapp/atm_card.dart';

class RotateContainer extends StatelessWidget {
  final Duration rotationDuration;
  final ValueNotifier<bool> _isRotated;

  RotateContainer({
    Key? key,
    this.rotationDuration = const Duration(seconds: 1)})
      : _isRotated = ValueNotifier(false), super(
      key: key);

  void _onTap() {
    _isRotated.value = !_isRotated.value;
  }

  Widget _buildFront() {
    return ClipOval(
      child: Container(
        width: 30,
        height: 30,
        child: Image.asset('assets/new.png'),
      ),
    );
  }

  Widget _buildBack() {
    return ClipOval(
      child: Container(
        width: 30,
        height: 30,
        child: Image.asset('assets/crown.png'),
      ),
    );
  }

  Widget _headerIcon() {
    return Center(
      child: GestureDetector(
        onTap: _onTap,
        child: ValueListenableBuilder<bool>(
          valueListenable: _isRotated,
          builder: (context, isRotated, child) {
            return TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: isRotated ? 2 * pi : 0),
              duration: rotationDuration,
              builder: (context, double value, child) {
                bool isFront = value <= pi / 2 || value >= 3 * pi / 2;
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(value),
                  child: isFront ? _buildFront() : _buildBack(),
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("Bank"),
            Spacer(),
            _headerIcon(),
          ],
        ),
      ),
      body: CardScreen(),
    );
  }
}
