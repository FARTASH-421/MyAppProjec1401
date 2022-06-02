import 'package:my_pojects/SaveData/SiveInfo.dart';

class MyDataInf {
  static late List<Information> _listInfo;
  static late MyDataInf instance;

  MyDataInf();

  List<Information> get listInfo => _listInfo;

  set listInfo(List<Information> value) {
    _listInfo = value;
  }

  static MyDataInf getInstance() {
    if (instance == null) {
      instance = MyDataInf();
    }
    return instance;
  }
}
