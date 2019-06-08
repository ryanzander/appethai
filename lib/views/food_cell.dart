import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../resources/constants.dart';

class FoodCell extends StatelessWidget {
  final food;
  FoodCell(this.food);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mediumGreen,
      padding: EdgeInsets.only(right: 12.0),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(12.0),
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(2.0, 6.0),
                  blurRadius: 8.0,
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/food_images/${this.food.image}',
              height: 70.0,
              width: 70.0,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 17.0,
                  width: 55.0,
                  child: Image.asset(
                      'assets/images/icons/${this.food.spiciness}.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                ),
                AutoSizeText(
                  '${this.food.nameEng}',
                  style: TextStyle(
                    color: lightYellow,
                    fontSize: 17.0,
                  ),
                  maxLines: 2,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                ),
                AutoSizeText(
                  '${this.food.nameThaiEng}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
