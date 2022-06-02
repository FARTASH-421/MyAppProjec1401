import 'package:flutter/material.dart';

import '../../Home/pageKala.dart';
import 'MoreBooks.dart';

class Books_Things {
  BuildContext context;

  Books_Things(this.context);

  List<CardItem> items = [
    const CardItem(
      title: 'كتاب',
      urlImage:
          'https://bookriot.com/wp-content/uploads/2022/02/stack-of-books-in-a-bookstore-1280x720.png',
      subtitle: '4 کالا',
    ),
    const CardItem(
      title: 'لوازم التحرير',
      urlImage: 'https://etud.ir/wp-content/uploads/2020/10/2.jpg',
      subtitle: '5 کالا',
    ),
    const CardItem(
      title: 'موسيقي',
      urlImage:
          "https://fastly.4sqi.net/img/general/600x600/14586642_9NpZIB7ioJ4uyEoUVbndLa0oZsrWH8Cwo4QNDfCK__I.jpg",
      subtitle: '6 کالا',
    ),
    const CardItem(
      title: 'صنايع دستي',
      urlImage:
          'https://img9.irna.ir/old/Image/1396/13960928/82768938/82768938-72062492.jpg',
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
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyBooks(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
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
              " كتاب و لوازم التحرير",
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
