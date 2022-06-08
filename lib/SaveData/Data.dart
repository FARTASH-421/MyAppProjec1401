import 'package:my_pojects/SaveData/SiveInfo.dart';

class MyDataInf {
  Information MyInof= Information("Fartash_421", "09926067519", "aqqf2425",
      "Leaf", "aq.fartash.421@gmail.com");
  static late List<Information> _listInfo;
  static MyDataInf? _instance= null;
  MyDataInf(){
    _listInfo= <Information>[];
    _listInfo.add(MyInof);
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
