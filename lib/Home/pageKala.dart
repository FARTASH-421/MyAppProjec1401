import 'package:flutter/material.dart';

import '../Things/Clothing/Colts.dart';

class ShoePage extends StatelessWidget {
  final CardItem item;

  const ShoePage({
    required this.item,
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Column(
        children: [
          AspectRatio(aspectRatio: 4/3,
            child: Image.network(
              item.urlImage,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8,),
          Text(
            item.title+'\n'+item.subtitle,
            style: const TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
