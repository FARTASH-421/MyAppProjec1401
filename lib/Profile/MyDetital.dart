import 'package:flutter/material.dart';
import 'package:my_pojects/Things/Tachonology/MoreTachonology.dart';

class IconProfile {
  BuildContext context;

  IconProfile(this.context);

  List<MyCard> items = [
    const MyCard(
      title:'در حال پردازش',
      urlImage:
    'https://i.pinimg.com/originals/b7/aa/f9/b7aaf94d7c34c81d57bf028e9d58377c.gif',
     // subtitle: '1900 کالا',
    ),
    const MyCard(
      title: 'کیف پول',
      urlImage: 'https://m.media-amazon.com/images/S/aplus-media/sc/a74e5867-b675-4d32-bc86-ba94f62d1f36.__CR0,0,970,600_PT0_SX970_V1___.jpg',
      // subtitle: '1600 کالا',
    ),
    const MyCard(
      title: 'زمان رسید کالا',
      urlImage: 'https://i.pinimg.com/originals/46/ce/77/46ce77c5c4978482f6208ad4cc920385.gif',
      // subtitle: '1400 کالا',
    ),
  ];

  Widget buildContiner() => SizedBox(
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

  Widget buildCard({ required item,}) {
    return
      SizedBox(
        width: 200,
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 7/5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Material(
                    child: Ink.image(
                      image: NetworkImage(item.urlImage),
                      fit: BoxFit.cover,
                      child: const InkWell(
                        // onTap: () => Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => MyTachoNa(item: item),
                        //   ),
                        // ),
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
          ],
        ),
      );

  }
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextButton(
        onPressed: () {},
        child: const Text(
          "کالای دیجیتال",
          style: TextStyle(
            // fontFamily: 'Nas',
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

class MyCard{
  final String title;
  final String urlImage;


  const MyCard({
    required this.title,
    required this.urlImage,
  });
}
