import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Things/BooksAndThings/BooksAndThings.dart';
import '../Things/Clothing/Colts.dart';
import '../Things/Sports/Sports.dart';
import '../Things/Tachonology/ComputerAndMobile.dart';
import 'headrWithSearchBox.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Cloths _colts = Cloths(context);
    Comp _comp = Comp(context);
    Spotr _sport = Spotr(context);
    Books_Things _book = Books_Things(context);

    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          HeadrWithSearchBox(
            size: size,
          ),
          SizedBox(
            height: 14,
          ),
          _comp.build(context),
          _colts.build(context),
          _book.build(context),
          _sport.build(context),
        ],
      ),
    );
  }
}
