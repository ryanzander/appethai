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
                  popular(context),
                  rice(context),
                  noodles(context),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  curries(context),
                  fried(context),
                  grilled(context),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  soups(context),
                  salads(context),
                  vegetarian(context),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  northern(context),
                  southern(context),
                  other(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Popular
  Widget popular(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 0.5, bottom: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    print('polular');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodListScreen()),
                    );
                  },
                  child: Image.asset(
                      'assets/images/icons/button_category_popular.png'),
                ),
              ),
              Text(
                'POPULAR',
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

  // Rice
  Widget rice(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 0.5, right: 0.5, bottom: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    print('rice');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodListScreen()),
                    );
                  },
                  child: Image.asset(
                      'assets/images/icons/button_category_rice.png'),
                ),
              ),
              Text(
                'RICE',
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

  // Noodles
  Widget noodles(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 0.5, bottom: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    print('noodles');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodListScreen()),
                    );
                  },
                  child: Image.asset(
                      'assets/images/icons/button_category_noodles.png'),
                ),
              ),
              Text(
                'NOODLES',
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

  // Curries
  Widget curries(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 0.5, top: 0.5, bottom: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    print('curries');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodListScreen()),
                    );
                  },
                  child: Image.asset(
                      'assets/images/icons/button_category_curry.png'),
                ),
              ),
              Text(
                'CURRIES',
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

  // Fried
  Widget fried(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    print('fried');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodListScreen()),
                    );
                  },
                  child: Image.asset(
                      'assets/images/icons/button_category_fried.png'),
                ),
              ),
              Text(
                'FRIED',
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

  // Grilled
  Widget grilled(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 0.5, top: 0.5, bottom: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    print('grilled');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodListScreen()),
                    );
                  },
                  child: Image.asset(
                      'assets/images/icons/button_category_grilled.png'),
                ),
              ),
              Text(
                'GRILLED',
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

  // Soups
  Widget soups(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 0.5, top: 0.5, bottom: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    print('soups');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodListScreen()),
                    );
                  },
                  child: Image.asset(
                      'assets/images/icons/button_category_soups.png'),
                ),
              ),
              Text(
                'SOUPS',
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

  // Salads
  Widget salads(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    print('salads');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodListScreen()),
                    );
                  },
                  child: Image.asset(
                      'assets/images/icons/button_category_salads.png'),
                ),
              ),
              Text(
                'SALADS',
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

  // Vegetarian
  Widget vegetarian(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 0.5, top: 0.5, bottom: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    print('vegetarian');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodListScreen()),
                    );
                  },
                  child: Image.asset(
                      'assets/images/icons/button_category_vegeterian.png'),
                ),
              ),
              Text(
                'VEGETARIAN',
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

  // Northern
  Widget northern(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 0.5, top: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    print('northern');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodListScreen()),
                    );
                  },
                  child: Image.asset(
                      'assets/images/icons/button_category_northern.png'),
                ),
              ),
              Text(
                'NORTHERN',
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

  // Southern
  Widget southern(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 0.5, left: 0.5, top: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    print('southern');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodListScreen()),
                    );
                  },
                  child: Image.asset(
                      'assets/images/icons/button_category_southern.png'),
                ),
              ),
              Text(
                'SOUTHERN',
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

  // Other
  Widget other(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 0.5, top: 0.5),
        color: mediumGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    print('other');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodListScreen()),
                    );
                  },
                  child: Image.asset(
                      'assets/images/icons/button_category_other.png'),
                ),
              ),
              Text(
                'OTHER',
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
