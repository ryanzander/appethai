import 'package:flutter/material.dart';

import '../resources/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AppeThai',
          style: TextStyle(
            color: lightYellow,
          ),
        ),
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
                      seeAll(),
                      categories(),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      favorites(),
                      nearby(),
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
  Widget seeAll() {
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
  Widget categories() {
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
  Widget favorites() {
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
  Widget nearby() {
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
