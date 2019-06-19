import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';

import '../model/food.dart';
import '../resources/constants.dart';
import 'categories_screen.dart';
import 'food_list_screen.dart';
import 'nearby_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  List<Food> _foodList = [];

  _loadJson() async {
    final jsonString = await rootBundle.loadString('assets/dish.json');
    final map = json.decode(jsonString);

    map.forEach((item) {
      var food = Food(item);
      _foodList.add(food);
    });

    allFoods = _foodList; // setting the global variable
  }

  _launchURL() async {
    const url = 'https://iglu.net';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    _loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/general/appethai.png'),
        backgroundColor: darkGreen,
      ),
      body: Container(
        color: lightGreen,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      _seeAll(context),
                      _categories(context),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      _favorites(context),
                      _nearby(context),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                height: 100.0,
                width: 140.0,
                color: mediumGreen,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("By",
                        style: TextStyle(
                          color: lightYellow,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        )),
                    FlatButton(
                      onPressed: _launchURL,
                      padding: EdgeInsets.all(0.0),
                      child:
                          Image.asset('assets/images/general/iglu_white.png'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// See all
  Widget _seeAll(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 0.5, bottom: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 120.0,
                width: 120.0,
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FoodListScreen(null)),
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
  Widget _categories(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 0.5, bottom: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 120.0,
                width: 120.0,
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
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
  Widget _favorites(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 0.5, top: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 120.0,
                width: 120.0,
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FoodListScreen('favorites')),
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
  Widget _nearby(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 0.5, top: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 120.0,
                width: 120.0,
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
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
