class Food extends Object {
  String audio;
  List category;
  String desc;
  int id;
  String image;
  bool isFavorite;
  String keyword;
  //String language;
  String nameEng;
  String nameThai;
  String nameThaiEng;
  String spiciness;

  Food(Map map) {
    this.audio = map["audio"];
    this.category = map['category'];
    this.desc = map['desc'];
    this.id = map['id'];
    this.image = map['image'];
    this.isFavorite = false;
    this.keyword = map['keyword'];
    //this.language = map['language'];
    this.nameEng = map['name_eng'];
    this.nameThai = map['name_thai'];
    this.nameThaiEng = map['name_thai_eng'];
    this.spiciness = map['spiciness'];
  }
}

var allFoods;
