import 'package:flutter/material.dart';

import 'package:audioplayers/audio_cache.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  _playAudio(int id) {
    player.play('sounds/$id.mp3');
  }

  @override
  void initState() {
    super.initState();
    _checkFavorites();
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
          color: mediumGreen,
          image: DecorationImage(
            image: AssetImage('assets/images/general/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              _foodName(),
              _imageBox(),
              _chiliBox(),
              _descBox(),
              _bottomButtons(),
            ],
          ),
        ),
      ),
    );
  }

  //food name
  Widget _foodName() {
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
                    fontWeight: FontWeight.w500,
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
  Widget _imageBox() {
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
  Widget _chiliBox() {
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
  Widget _descBox() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12.0),
            color: mediumGreen,
            child: AutoSizeText(
              '${widget.food.desc}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
              maxLines: 5,
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }

  // bottom buttons
  Widget _bottomButtons() {
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
              child: Image.asset(_setButton()),
              onPressed: () {
                _favBtnPressed();
              },
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
                _playAudio(widget.food.id);
              },
            ),
          )
        ],
      ),
    );
  }

  String _setButton() {
    print("set button");
    if (widget.food.isFavorite == true) {
      return 'assets/images/icons/button_favorites_dark.png';
    } else {
      return 'assets/images/icons/button_favorites.png';
    }
  }

  _favBtnPressed() {
    if (widget.food.isFavorite == true) {
      print(widget.food.isFavorite);
      widget.food.isFavorite = false;
      _removeFromFavorites();
    } else {
      print(widget.food.isFavorite);
      widget.food.isFavorite = true;
      _addToFavorites();
    }
    setState(() {
      _setButton();
    });
  }

  _addToFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var favorites = prefs.get('favorites') ?? [];

    final id = "${widget.food.id}";
    List<String> tempList = [];

    favorites.forEach((item) {
      tempList.add(item);
    });
    tempList.add(id);

    prefs.setStringList('favorites', tempList);
  }

  _removeFromFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var favorites = prefs.get('favorites') ?? [];

    final id = "${widget.food.id}";
    List<String> tempList = [];
    favorites.forEach((item) {
      if (item != id) {
        tempList.add(item);
      }
    });

    prefs.setStringList('favorites', tempList);
  }

  _checkFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var favorites = prefs.get('favorites') ?? [];

    final id = "${widget.food.id}";
    var isFavorite = false;
    if (favorites.contains(id)) {
      isFavorite = true;
    }

    if (isFavorite == true) {
      widget.food.isFavorite = true;
    } else {
      widget.food.isFavorite = false;
    }
    setState(() {
      _setButton();
    });
  }
}
