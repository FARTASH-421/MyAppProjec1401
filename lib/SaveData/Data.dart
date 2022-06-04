import 'package:my_pojects/SaveData/SiveInfo.dart';

class MyDataInf {
  static late List<Information> _listInfo;
  static MyDataInf? _instance= null;
  MyDataInf(){
    _listInfo= <Information>[];
  }

  List<Information> get listInfo => _listInfo;

  set listInfo(List<Information> value) {
    _listInfo = value;
  }

  static MyDataInf? getInstance() {
    if (_instance == null) {
      _instance = MyDataInf();
    }
    return _instance;
  }
}
