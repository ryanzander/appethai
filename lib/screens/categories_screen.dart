import 'package:flutter/material.dart';

import '../resources/constants.dart';
import 'food_list_screen.dart';

class CategoriesScreen extends StatelessWidget {
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
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  _popular(context),
                  _rice(context),
                  _noodles(context),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  _curries(context),
                  _fried(context),
                  _grilled(context),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  _soups(context),
                  _salads(context),
                  _vegetarian(context),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  _northern(context),
                  _southern(context),
                  _other(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Popular
  Widget _popular(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 0.5, bottom: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: FlatButton(
                    padding: EdgeInsets.all(10.0),
                    onPressed: () {
                      print('polular');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodListScreen("popular")),
                      );
                    },
                    child: Image.asset(
                        'assets/images/icons/button_category_popular.png'),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'POPULAR',
                  style: TextStyle(
                    color: lightYellow,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Rice
  Widget _rice(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 0.5, right: 0.5, bottom: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: FlatButton(
                    padding: EdgeInsets.all(10.0),
                    onPressed: () {
                      print('rice');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodListScreen('rice')),
                      );
                    },
                    child: Image.asset(
                        'assets/images/icons/button_category_rice.png'),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'RICE',
                  style: TextStyle(
                    color: lightYellow,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Noodles
  Widget _noodles(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 0.5, bottom: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: FlatButton(
                    padding: EdgeInsets.all(10.0),
                    onPressed: () {
                      print('noodles');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodListScreen('noodles')),
                      );
                    },
                    child: Image.asset(
                        'assets/images/icons/button_category_noodles.png'),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'NOODLES',
                  style: TextStyle(
                    color: lightYellow,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Curries
  Widget _curries(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 0.5, top: 0.5, bottom: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: FlatButton(
                    padding: EdgeInsets.all(10.0),
                    onPressed: () {
                      print('curries');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodListScreen('curries')),
                      );
                    },
                    child: Image.asset(
                        'assets/images/icons/button_category_curry.png'),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'CURRIES',
                  style: TextStyle(
                    color: lightYellow,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fried
  Widget _fried(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: FlatButton(
                    padding: EdgeInsets.all(10.0),
                    onPressed: () {
                      print('fried');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodListScreen('fried')),
                      );
                    },
                    child: Image.asset(
                        'assets/images/icons/button_category_fried.png'),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'FRIED',
                  style: TextStyle(
                    color: lightYellow,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Grilled
  Widget _grilled(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 0.5, top: 0.5, bottom: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: FlatButton(
                    padding: EdgeInsets.all(10.0),
                    onPressed: () {
                      print('grilled');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodListScreen('grilled')),
                      );
                    },
                    child: Image.asset(
                        'assets/images/icons/button_category_grilled.png'),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'GRILLED',
                  style: TextStyle(
                    color: lightYellow,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Soups
  Widget _soups(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 0.5, top: 0.5, bottom: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: FlatButton(
                    padding: EdgeInsets.all(10.0),
                    onPressed: () {
                      print('soups');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodListScreen('soups')),
                      );
                    },
                    child: Image.asset(
                        'assets/images/icons/button_category_soups.png'),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'SOUPS',
                  style: TextStyle(
                    color: lightYellow,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Salads
  Widget _salads(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: FlatButton(
                    padding: EdgeInsets.all(10.0),
                    onPressed: () {
                      print('salads');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodListScreen('salads')),
                      );
                    },
                    child: Image.asset(
                        'assets/images/icons/button_category_salads.png'),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'SALADS',
                  style: TextStyle(
                    color: lightYellow,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Vegetarian
  Widget _vegetarian(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 0.5, top: 0.5, bottom: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: FlatButton(
                    padding: EdgeInsets.all(10.0),
                    onPressed: () {
                      print('vegetarian');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodListScreen('vegetarian')),
                      );
                    },
                    child: Image.asset(
                        'assets/images/icons/button_category_vegeterian.png'),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'VEGETARIAN',
                  style: TextStyle(
                    color: lightYellow,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Northern
  Widget _northern(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 0.5, top: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: FlatButton(
                    padding: EdgeInsets.all(10.0),
                    onPressed: () {
                      print('northern');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodListScreen('northern')),
                      );
                    },
                    child: Image.asset(
                        'assets/images/icons/button_category_northern.png'),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'NORTHERN',
                  style: TextStyle(
                    color: lightYellow,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Southern
  Widget _southern(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 0.5, left: 0.5, top: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: FlatButton(
                    padding: EdgeInsets.all(10.0),
                    onPressed: () {
                      print('southern');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodListScreen('southern')),
                      );
                    },
                    child: Image.asset(
                        'assets/images/icons/button_category_southern.png'),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'SOUTHERN',
                  style: TextStyle(
                    color: lightYellow,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Other
  Widget _other(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 0.5, top: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: FlatButton(
                    padding: EdgeInsets.all(10.0),
                    onPressed: () {
                      print('other');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodListScreen('other')),
                      );
                    },
                    child: Image.asset(
                        'assets/images/icons/button_category_other.png'),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'OTHER',
                  style: TextStyle(
                    color: lightYellow,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
