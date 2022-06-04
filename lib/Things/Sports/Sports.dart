import 'package:flutter/material.dart';
import 'package:my_pojects/Things/Sports/ColtsSport.dart';
import 'package:my_pojects/Things/Sports/MoreSports.dart';

import '../../Home/home_page.dart';
import '../ShowDetails.dart';

class Spotr {
  BuildContext context;

  Spotr(this.context);

  List<CardItem> items = [
    const CardItem(
      title: 'پوشاک ورزشی',
      urlImage:
          'https://kachiran.com/photos/shares/%D9%84%D8%A8%D8%A7%D8%B3%20%D9%88%D8%B1%D8%B2%D8%B4%DB%8C/%D8%AE%D8%B1%DB%8C%D8%AF-%D9%84%D8%A8%D8%A7%D8%B3-%D9%88%D8%B1%D8%B2%D8%B4%DB%8C-%D9%81%D9%88%D8%AA%D8%A8%D8%A7%D9%84.jpg',
      subtitle: '4 کالا',
    ),
    const CardItem(
      title: 'لوازم ورزشي',
      urlImage:
          'https://www.webgohar.com/wp-content/uploads/2020/12/%D8%B7%D8%B1%D8%A7%D8%AD%DB%8C-%D8%B3%D8%A7%DB%8C%D8%AA-%D9%84%D9%88%D8%A7%D8%B2%D9%85-%D9%88%D8%B1%D8%B2%D8%B4%DB%8C1.png',
      subtitle: '5 کالا',
    ),
    const CardItem(
      title: ' لوازم سفر و كمپينگ',
      urlImage:
          "https://alfablog.ir/wp-content/uploads/2021/12/1-1-850x560.jpg",
      subtitle: '6 کالا',
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
                      child:InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MoreSports(
                              item:item,
                            ),
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
              "ورزش و سفر",
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
