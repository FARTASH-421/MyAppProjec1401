import 'package:flutter/material.dart';
import '../Home/home_page.dart';
import '../Home/pageKala.dart';

class Colts{
  BuildContext context;
  Colts(this.context);
  List<CardItem> items =[
    const CardItem(
      title:'Nike Free Run',
      urlImage:
      'https://i.pinimg.com/736x/ab/bd/b1/abbdb1954ecad492115928d64877da31--shoe-game-adidas-originals.jpg',
      subtitle: '\$99',
    ),

    const CardItem(
      title:'Nike Good Run',
      urlImage:
      'https://4.imimg.com/data4/MK/QN/ANDROID-35738063/product-500x500.jpeg',
      subtitle: '\$230',
    ),
    const CardItem(
      title:'Nike Free Good',
      urlImage:
      'https://pngimg.com/uploads/running_shoes/running_shoes_PNG5782.png',
      subtitle: '\$991',
    ),
    const CardItem(
      title:'Nike Free Run',
      urlImage:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-cI8qTrtXNMLroKqpxPhR9UfwCgTZE1juAw&usqp=CAU',
      subtitle: '\$932',
    ),
    const CardItem(
      title:'Nike Free Run',
      urlImage:
      'https://cdn.picpng.com/running_shoes/running-shoes-hd-36324.png',
      subtitle: '\$299',
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
            aspectRatio: 4/3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Material(
                child: Ink.image(
                  image: AssetImage(
                    'images/PngItem.png',),
                  fit: BoxFit.cover,
                  child: InkWell(
                    onTap: ()=> Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>ShoePage(item:item),

                      ),
                    ),
                  ),

                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4,),
        Text(item.title, style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
        Text(item.subtitle, style: const TextStyle(fontSize: 16,color: Colors.lightBlueAccent),),

      ],
    ),
  );
  Widget build(BuildContext context)=>Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)
            ,color: Colors.orange),
        child: TextButton(
          onPressed: (){ },
          child: const Text("Colts", style: TextStyle(
            fontFamily: 'Kurale',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),),
        ) ,
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