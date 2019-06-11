import 'package:flutter/material.dart';

import 'package:audioplayers/audio_cache.dart';
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
  static AudioCache player = AudioCache();
  playAudio(int id) {
    player.play('/sounds/$id.mp3');
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/general/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              foodName(),
              imageBox(),
              chiliBox(),
              descBox(),
              bottomButtons(),
            ],
          ),
        ),
      ),
    );
  }

  //food name
  Widget foodName() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AutoSizeText(
                  '${widget.food.nameEng}',
                  style: TextStyle(
                    color: lightYellow,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                Container(height: 4),
                AutoSizeText(
                  '${widget.food.nameThaiEng}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                Container(height: 2),
                AutoSizeText(
                  '${widget.food.nameThai}',
                  style: TextStyle(
                    color: textGreen,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // image box
  Widget imageBox() {
    return Expanded(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 25.0, left: 40.0, right: 40.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 4,
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(2.0, 6.0),
                  blurRadius: 12.0,
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/food_images/${widget.food.image}',
            ),
          ),
        ),
      ),
    );
  }

  // chili box
  Widget chiliBox() {
    return Container(
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
    );
  }

  // desc box
  Widget descBox() {
    return Row(
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
    );
  }

  // bottom buttons
  Widget bottomButtons() {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 40.0,
            width: 40.0,
            child: FlatButton(
              padding: EdgeInsets.all(0.0),
              child: Image.asset('assets/images/icons/button_favorites.png'),
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
              onPressed: () {
                playAudio(widget.food.id);
              },
            ),
          )
        ],
      ),
    );
  }
}
