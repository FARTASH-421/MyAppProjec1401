import '../Things/Data.dart';

class BasketList {
  static BasketList? _instance = null;
  static late List<MyData> _listBasket;

  BasketList(){
   _listBasket =[];
  }

  List<MyData> get listBasket => _listBasket;

  set listBasket(List<MyData> value) {
    _listBasket = value;
  }

  static BasketList? getInstance (){
    if (_instance == null) {
      _instance = BasketList();
    }
    return _instance;
  }
}
