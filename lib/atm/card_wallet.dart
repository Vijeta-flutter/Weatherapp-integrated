// import 'package:flutter/material.dart';
// import 'package:weatherapp/constants/color_constants.dart';
// import 'package:weatherapp/credit_card_widget.dart';
//
// class Wallet extends StatefulWidget {
//
//
//   @override
//   State<Wallet> createState() => _WalletState();
// }
//
// class _WalletState extends State<Wallet> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConstant.primaryBackground,
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//         mini: true,
//         backgroundColor: ColorConstant.fabButtonBgColor,
//         child: Icon(
//           Icons.add_circle_outline_rounded,
//           size: 30,
//         color: Colors.white.withOpacity(0.8),
//         ),
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text(
//             "My Wallet",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 26,
//             color: ColorConstant.textColor,
//             shadows: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.2),
//                 offset: const Offset(0, 2),
//                 blurRadius: 5
//               )
//             ]
//           ),
//         ),
//       ),
//       body: SafeArea(
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             child:ListView.builder(
//                 itemCount: 10,
//                 itemBuilder: (context, index) {
//                   if (index == 9) {
//                     return SizedBox(height: 120);
//                   }
//                   return Align(
//                       heightFactor: 0.8,
//                       alignment: Alignment.topCenter,
//                       child: CreditCardWidget());
//                   },
//             ),
//           ),
//       ),
//     );
//   }
// }
// //
// import 'package:flutter/material.dart';
// import 'package:weatherapp/atm/constants/color_constants.dart';
// import 'package:weatherapp/atm/credit_card_widget.dart';
//
// class Wallet extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConstant.primaryBackground,
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         mini: true,
//         backgroundColor: ColorConstant.fabButtonBgColor,
//         child: Icon(
//           Icons.add_circle_outline_rounded,
//           size: 30,
//           color: Colors.white.withOpacity(0.8),
//         ),
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text(
//           "My Wallet",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 26,
//             color: ColorConstant.textColor,
//             shadows: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.2),
//                 offset: const Offset(0, 2),
//                 blurRadius: 5,
//               )
//             ],
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 10),
//           child: ListView.builder(
//             itemCount: 10,
//             itemBuilder: (context, index) {
//               if (index == 9) {
//                 return SizedBox(height: 120);
//               }
//
//               return Align(
//                 heightFactor: 0.8,
//                 alignment: Alignment.topCenter,
//                 child: CreditCardWidget(),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:weatherapp/atm/constants/color_constants.dart';
import 'package:weatherapp/atm/credit_card_widget.dart';

class Wallet extends StatelessWidget {
  final ValueNotifier<List<bool>> _isCardExpanded = ValueNotifier<List<bool>>(
    List.generate(10, (index) => false),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryBackground,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        mini: true,
        backgroundColor: ColorConstant.fabButtonBgColor,
        child: Icon(
          Icons.add_circle_outline_rounded,
          size: 30,
          color: Colors.white.withOpacity(0.8),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "My Wallet",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: ColorConstant.textColor,
            shadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 2),
                blurRadius: 5,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: ValueListenableBuilder<List<bool>>(
          valueListenable: _isCardExpanded,
          builder: (context, isCardExpanded, child) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                if (index == 9) {
                  return SizedBox(height: 120);
                }

                return GestureDetector(
                  onTap: () {
                    isCardExpanded[index] = !isCardExpanded[index];
                    _isCardExpanded.value = List.from(isCardExpanded); // Notify listeners
                  },
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                      begin: isCardExpanded[index] ? 0.2 : 0.8,
                      end: isCardExpanded[index] ? 0.8 : 0.2,
                    ),
                    duration: Duration(milliseconds: 300),
                    builder: (context, heightFactor, child) {
                      return Align(
                        heightFactor: heightFactor,
                        alignment: Alignment.topCenter,
                        child: CreditCardWidget(),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
