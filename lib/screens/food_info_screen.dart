import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../model/food.dart';
import '../resources/constants.dart';

class FoodInfoScreen extends StatefulWidget {
  final Food food;

  FoodInfoScreen(this.food);

  @override
  State<StatefulWidget> createState() {
    return FoodInfoState();
  }
}

class FoodInfoState extends State<FoodInfoScreen> {
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/general/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      child: AutoSizeText(
                        '${widget.food.nameThai}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        maxLines: 1,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 25.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 6,
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(2.0, 6.0),
                      blurRadius: 12.0,
                    ),
                  ],
                ),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/food_images/${widget.food.image}',
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(6.0),
                            color: Colors.white.withAlpha(225),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: AutoSizeText(
                                        '${widget.food.nameEng}',
                                        style: TextStyle(
                                          color: textGreen,
                                          fontSize: 12,
                                        ),
                                        maxLines: 2,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 4.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: AutoSizeText(
                                        '${widget.food.nameThaiEng}',
                                        style: TextStyle(
                                          color: textRed,
                                          fontSize: 15,
                                        ),
                                        maxLines: 2,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 40.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/general/taste_bg.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
                    child: Image.asset(
                      'assets/images/icons/${widget.food.spiciness}.png',
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      color: mediumGreen,
                      child: Text(
                        '${widget.food.desc}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      width: 40.0,
                      child: FlatButton(
                        padding: EdgeInsets.all(0.0),
                        child: Image.asset(
                            'assets/images/icons/button_favorites.png'),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      width: 20.0,
                    ),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      child: FlatButton(
                        padding: EdgeInsets.all(0.0),
                        child: Image.asset('assets/images/icons/play.png'),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
