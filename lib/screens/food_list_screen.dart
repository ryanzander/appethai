import 'package:flutter/material.dart';

import '../resources/constants.dart';
import 'food_info_screen.dart';

class FoodListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/general/appethai.png'),
        backgroundColor: darkGreen,
        iconTheme: IconThemeData(
          color: lightYellow,
        ),
      ),
      body: Container(
        color: lightGreen,
        child: Center(
          child: Text("Food list"),
        ),
      ),
    );
  }
}
