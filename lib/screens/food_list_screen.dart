import 'package:flutter/material.dart';

import '../model/food.dart';
import '../resources/constants.dart';
import '../views/food_cell.dart';
import 'food_info_screen.dart';

class FoodListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FoodListState();
  }
}

class FoodListState extends State<FoodListScreen> {
  @override
  void initState() {
    super.initState();
    print("on food list screen");
    print(allFoods.length);
  }

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
        color: mediumGreen,
        /*
        child: Center(
          child: Column(
            children: <Widget>[*/
        //child: Expanded(
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(
                color: lightGreen,
              ),
          itemCount: allFoods.length,
          itemBuilder: (context, i) {
            final food = allFoods[i];
            return FlatButton(
              padding: EdgeInsets.all(0.0),
              child: FoodCell(food),
              onPressed: () {
                print("clicked $i");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FoodInfoScreen()));
              },
            );
          },
        ),
        /*    ],
          ),
        ),
      ),*/
      ),
    );
  }
}
