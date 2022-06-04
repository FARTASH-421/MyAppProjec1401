import '../Things/Data.dart';

class MyBasket {
  static MyBasket? _instance = null;
  static late List<MyData> _listBasket;

  MyBasket(){
   _listBasket =[];
  }

  List<MyData> get listBasket => _listBasket;

  set listBasket(List<MyData> value) {
    _listBasket = value;
  }

  static MyBasket? getInstance (){
    if (_instance == null) {
      _instance = MyBasket();
    }
    return _instance;
  }
}
