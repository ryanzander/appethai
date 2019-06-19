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
  List<Food> _filteredList = [];
  String _searchTerm = "";
  TextEditingController _editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() {
    if (widget.category == null) {
      _foodList = allFoods;
      _filteredList.clear();
      _filteredList.addAll(_foodList);
    } else if (widget.category == "favorites") {
      _getFavorites();
    } else {
      _foodList.clear();
      _filteredList.clear();
      allFoods.forEach(
        (food) {
          final categories = food.category;
          if (categories.contains(widget.category)) {
            _foodList.add(food);
          }
        },
      );
      _filteredList.addAll(_foodList);
    }
    if (_searchTerm != "") {
      _filterSearchResults(_searchTerm);
    }
  }

  _getFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var favorites = prefs.get('favorites') ?? [];

    _foodList.clear();
    _filteredList.clear();
    allFoods.forEach(
      (food) {
        final id = '${food.id}';
        if (favorites.contains(id)) {
          _foodList.add(food);
        }
      },
    );
    setState(() {
      _filteredList.addAll(_foodList);
      if (_searchTerm != "") {
        _filterSearchResults(_searchTerm);
      }
    });
  }

  void _filterSearchResults(String query) {
    _searchTerm = query.toLowerCase();
    List<Food> searchList = [];
    searchList.addAll(_foodList);
    //
    if (query.isNotEmpty) {
      List<Food> matchList = [];
      searchList.forEach((food) {
        final nameEng = food.nameEng;
        final nameThai = food.nameThai;
        final nameThaiEng = food.nameThaiEng;
        final keyword = food.keyword;
        final stringToMatch =
            '$nameEng $nameThai $nameThaiEng $keyword'.toLowerCase();

        if (stringToMatch.contains(_searchTerm)) {
          matchList.add(food);
        }
      });
      setState(() {
        _filteredList.clear();
        _filteredList.addAll(matchList);
      });
      return;
    } else {
      setState(() {
        _filteredList.clear();
        _filteredList.addAll(_foodList);
      });
    }
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
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Theme(
                  data: ThemeData(
                    primaryColor: darkGreen,
                  ),
                  child: TextField(
                    style: TextStyle(
                      color: darkGreen,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    cursorColor: darkGreen,
                    onChanged: (value) {
                      _filterSearchResults(value);
                    },
                    controller: _editingController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          color: darkGreen,
                          width: 2.0,
                        ),
                      ),
                      filled: true,
                      fillColor: lightGreen,
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: darkGreen,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: darkGreen,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                        color: lightGreen,
                      ),
                  itemCount: _filteredList.length,
                  itemBuilder: (context, i) {
                    final food = _filteredList[i];
                    return FlatButton(
                      padding: EdgeInsets.all(0.0),
                      child: FoodCell(food),
                      onPressed: () {
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
            ],
          )),
    );
  }
}
