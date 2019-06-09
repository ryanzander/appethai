//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/food.dart';
import '../resources/constants.dart';
import '../views/food_cell.dart';
import 'food_info_screen.dart';

class FoodListScreen extends StatefulWidget {
  final String category;
  FoodListScreen(this.category);

  @override
  State<StatefulWidget> createState() {
    return FoodListState();
  }
}

class FoodListState extends State<FoodListScreen> {
  List<Food> foodList = [];

  @override
  void initState() {
    super.initState();
    print("on food list screen");
    print(allFoods.length);

    if (widget.category == null) {
      foodList = allFoods;
    } else if (widget.category == "favorites") {
      useFavorites();
    } else {
      allFoods.forEach(
        (food) {
          final categories = food.category;
          if (categories.contains(widget.category)) {
            foodList.add(food);
          }
        },
      );
    }
  }

  useFavorites() async {
    final favorites = await getFavorites();
    allFoods.forEach(
      (food) {
        final id = '${food.id}';
        if (favorites.contains(id)) {
          setState(() {
            foodList.add(food);
          });
        }
      },
    );
  }

  Future<List> getFavorites() async {
    SharedPreferences.setMockInitialValues({
      // 'flutter.favorites': [2014080006, 2014080004]
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favorites', ['2014080006', '2014080004']);
    return prefs.get('favorites') ?? []; //[2014080006, 2014080004];
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
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(
                color: lightGreen,
              ),
          itemCount: foodList.length,
          itemBuilder: (context, i) {
            final food = foodList[i];
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
      ),
    );
  }
}
