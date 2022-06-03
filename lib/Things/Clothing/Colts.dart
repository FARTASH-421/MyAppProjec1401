import 'package:flutter/material.dart';
import 'package:my_pojects/Things/Clothing/MoreClots.dart';

class Colts {
  BuildContext context;

  Colts(this.context);

  List<CardItem> items = [
    const CardItem(
      title: 'زنانه',
      urlImage:
          'https://modbina.com/wp-content/uploads/2021/02/women538524.jpg',
      subtitle: '140 کالا',
    ),
    const CardItem(
      title: 'مردانه',
      urlImage:
          'https://media.sarpoosh.com/images/article/picture/handsome-way-men.jpg',
      subtitle: '140 کالا',
    ),
    const CardItem(
      title: 'بچگانه',
      urlImage:
          'https://tipza.ir/wp-content/uploads/2021/05/Hc6684a577fa54323ab63b8976af8d224Y.jpg',
      subtitle: '140 کالا',
    ),
  ];

  Widget buildContiner() => Container(
        height: 220,
        child: ListView.separated(
          padding: const EdgeInsets.all(10),
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) =>
              buildCard(item: items[index]),
          separatorBuilder: (BuildContext context, _) => const SizedBox(
            width: 2,
          ),
        ),
      );

  Widget buildCard({
    required CardItem item,
  }) =>
      Container(
        width: 200,
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Material(
                    child: Ink.image(
                      image: NetworkImage(
                        item.urlImage,
                      ),
                      fit: BoxFit.cover,
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyClots(item: item,),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              item.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            Text(
              item.subtitle,
              style:
                  const TextStyle(fontSize: 16, color: Colors.lightBlueAccent),
            ),
          ],
        ),
      );

  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "پوشاک",
              style: TextStyle(
                fontFamily: 'Kurale',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.orange,
              ),
            ),
          ),
          buildContiner(),
        ],
      );
}

class CardItem {
  final String title;
  final String urlImage;
  final String subtitle;

  const CardItem({
    required this.title,
    required this.urlImage,
    required this.subtitle,
  });
}
