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
  List<Food> _foodList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() {
    if (widget.category == null) {
      _foodList = allFoods;
    } else if (widget.category == "favorites") {
      _getFavorites();
    } else {
      _foodList.clear();
      allFoods.forEach(
        (food) {
          final categories = food.category;
          if (categories.contains(widget.category)) {
            _foodList.add(food);
          }
        },
      );
    }
  }

  _getFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var favorites = prefs.get('favorites') ?? [];
    print("List got favorites: $favorites");
    _foodList.clear();
    allFoods.forEach(
      (food) {
        final id = '${food.id}';
        if (favorites.contains(id)) {
          setState(() {
            _foodList.add(food);
          });
        }
      },
    );
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
          itemCount: _foodList.length,
          itemBuilder: (context, i) {
            final food = _foodList[i];
            return FlatButton(
              padding: EdgeInsets.all(0.0),
              child: FoodCell(food),
              onPressed: () {
                print("clicked $i");
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodInfoScreen(food)))
                    .whenComplete(_loadData);
              },
            );
          },
        ),
      ),
    );
  }
}
