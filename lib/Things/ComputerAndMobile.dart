import 'package:flutter/material.dart';
import '../Home/home_page.dart';
import '../Home/pageKala.dart';

class Comp{
  BuildContext context;
  Comp(this.context);
  List<CardItem> items =[
    const CardItem(
      title:'Nike Free Run',
        urlImage:
          'images/ComputerImage/2.jpg',
      subtitle: '\$99',
    ),
    const CardItem(
      title:'Nike Good Run',
      urlImage:
      'images/ComputerImage/1.webp',
      subtitle: '\$230',
    ),
    const CardItem(
      title:'Nike Free Good',
      urlImage:
    'images/ComputerImage/3.jpeg',
      subtitle: '\$991',
    ),
    const CardItem(
      title:'Nike Free Run',
      urlImage:
      'images/ComputerImage/5.jpg',
      subtitle: '\$932',
    ),
    const CardItem(
      title:'Nike Free Run',
      urlImage:
      'images/ComputerImage/6.jpg',
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
                    'images/ComputerImage/6.jpg',),
                  fit: BoxFit.cover,
                  child: InkWell(
                    onTap: ()
                    {}
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
            ,color: Colors.blue),
        child: TextButton(
          onPressed: (){ },
          child: const Text("Colts", style: TextStyle(
            fontFamily: 'Kurale',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.orange
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