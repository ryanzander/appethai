import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '../model/food.dart';
import '../resources/constants.dart';

import 'categories_screen.dart';
import 'food_list_screen.dart';
import 'nearby_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print('creating home state');
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  List<Food> foodList = [];

  loadJson() async {
    final jsonString = await rootBundle.loadString('assets/dish.json');

    final map = json.decode(jsonString);

    map.forEach((item) {
      var food = Food(item);
      foodList.add(food);
    });
    print(foodList.length);

    allFoods = foodList; // setting the global variable
    print(allFoods.length);
  }

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/general/appethai.png'),
        backgroundColor: darkGreen,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: lightGreen,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      seeAll(context),
                      categories(context),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      favorites(context),
                      nearby(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              color: mediumGreen,
              height: 80.0,
              width: 80.0,
              child: FlatButton(
                padding: EdgeInsets.all(4.0),
                child: Image.asset('assets/images/icons/random.png'),
                onPressed: () {
                  print('shake');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

// See all
  Widget seeAll(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 0.5, bottom: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 40.0, right: 40.0),
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    print('see all');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodListScreen()),
                    );
                  },
                  child: Image.asset('assets/images/icons/button_see_all.png'),
                ),
              ),
              Text(
                'SEE ALL',
                style: TextStyle(
                  color: lightYellow,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Categories
  Widget categories(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 0.5, bottom: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 40.0, right: 40.0),
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    print('categories');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoriesScreen()),
                    );
                  },
                  child:
                      Image.asset('assets/images/icons/button_categories.png'),
                ),
              ),
              Text(
                'CATEGORIES',
                style: TextStyle(
                  color: lightYellow,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Favorites
  Widget favorites(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 0.5, top: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 40.0, right: 40.0),
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    print('favorites');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodListScreen()),
                    );
                  },
                  child:
                      Image.asset('assets/images/icons/button_favorites.png'),
                ),
              ),
              Text(
                'FAVORITES',
                style: TextStyle(
                  color: lightYellow,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Nearby
  Widget nearby(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 0.5, top: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 40.0, right: 40.0),
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    print('nearby');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NearbyScreen()),
                    );
                  },
                  child: Image.asset('assets/images/icons/button_nearby.png'),
                ),
              ),
              Text(
                'NEARBY',
                style: TextStyle(
                  color: lightYellow,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
