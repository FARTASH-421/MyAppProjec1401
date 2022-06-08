import '../Things/Data.dart';

class MyFavorite {
  static MyFavorite? _instance = null;
  static late List<MyData> _listFavorite;

  MyFavorite(){
    _listFavorite =[];
  }

  List<MyData> get listFavorite => _listFavorite;

  set listFavorite(List<MyData> value) {
    _listFavorite = value;
  }

  static MyFavorite? getInstance (){
    if (_instance == null) {
      _instance = MyFavorite();
    }
    return _instance;
  }
}
