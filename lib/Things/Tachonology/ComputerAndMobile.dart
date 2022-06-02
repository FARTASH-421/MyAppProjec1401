import 'package:flutter/material.dart';
import '../../Home/home_page.dart';
import '../../Home/pageKala.dart';

class Comp{
  BuildContext context;
  Comp(this.context);
  List<CardItem> items =[
    const CardItem(
      title:'موبايل',
      urlImage:
      'images/ComputerImage/7.jpg',
      subtitle: '1900 کالا',
    ),
    const CardItem(
      title:'لپ تاپ',
      urlImage:
      'images/computer.webp',
      subtitle: '1600 کالا',
    ),
    const CardItem(
      title:'دوربین',
      urlImage:
      'images/camera.jpg',
      subtitle: '1400 کالا',
    ),
  ];

  Widget buildContiner()=> Container(
    height: 220,
    child: ListView.separated(
      padding: const EdgeInsets.all(10),
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index)=> buildCard( item: items[index]),
      separatorBuilder: (BuildContext context, _) => const SizedBox(width: 2,),
    ),
  );

  Widget buildCard({required CardItem item,})=>Container(
    width: 200,
    child: Column(
      children: [
        Expanded(
          child:AspectRatio(
            aspectRatio: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Material(
                child: Ink.image(
                  image: AssetImage(
                   item.urlImage),
                  fit: BoxFit.cover,
                  child: InkWell(
                    onTap: () {}
                    // => Navigator.push(
                    //   context,
                      // MaterialPageRoute(
                      //   // builder: (context) =>ShoePage(item:item),
                      //
                      // ),
                    // ),
                  ),

                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 2,),
        Text(item.title, style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
        Text(item.subtitle, style: const TextStyle(fontSize: 16,color: Colors.lightBlueAccent),),

      ],
    ),
  );

  Widget build(BuildContext context)=>Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextButton(
        onPressed: (){ },
        child: const Text("کالای دیجیتال", style: TextStyle(
          // fontFamily: 'Nas',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.orange,
        ),),
      ) ,
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