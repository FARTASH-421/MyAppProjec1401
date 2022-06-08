import 'package:flutter/material.dart';
import 'package:my_pojects/Things/Tachonology/MoreTachonology.dart';

class Comp {
  BuildContext context;

  Comp(this.context);

  List<CardItem> items = [
    const CardItem(
      title:'موبايل',
      urlImage:
    'https://media.4rgos.it/i/Argos/3321-m007-25-01-7835216-motorola-simfreemobile?maxW=768&qlt=75&fmt.jpeg.interlaced=true',
      subtitle: '1900 کالا',
    ),
    const CardItem(
      title: 'لپ تاپ',
      urlImage: 'https://i.dell.com/is/image/DellContent//content/dam/ss2/product-images/dell-client-products/notebooks/latitude-notebooks/13-3320/media-gallery/peripherals_laptop_latitude_3320_gallery_1.psd?fmt=pjpg&pscan=auto&scl=1&wid=3337&hei=2417&qlt=100,0&resMode=sharp2&size=3337,2417',
      subtitle: '1600 کالا',
    ),
    const CardItem(
      title: 'دوربین',
      urlImage: 'https://play-lh.googleusercontent.com/sqiNB2XdmvHJWcmbhsf6DcCZiTNayIvEeGjDkcmO6v9nlKFsITjnaBfC1wwZ6onLQQ',
      subtitle: '1400 کالا',
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
                aspectRatio: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Material(
                    child: Ink.image(
                      image: NetworkImage(item.urlImage),
                      fit: BoxFit.cover,
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyTachoNa(item: item),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              item.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              item.subtitle,
              style:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
              "    کالای دیجیتال"
                  ,
              style: TextStyle(
                // fontFamily: 'Nas',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF80D0D),
              ),
              textAlign: TextAlign.right,
            ),
          ),
          Container(
            height: 3,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFF80D0D),
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
