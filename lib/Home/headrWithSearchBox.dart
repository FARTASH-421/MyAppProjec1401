import 'package:flutter/material.dart';


const kPrimaryColor= Color(0xFF0C9869);
const kTextColor= Color(0xFF3C4046);
const kBackgroundColor= Color(0xFFF9F8FD);

const double kDefaultPadding = 20.0;

class HeadrWithSearchBox extends StatelessWidget {

  const HeadrWithSearchBox({
    Key? key,
    required this.size
  }) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: size.height * 0.2,
        child: Stack(
          children: [
            Container(
              padding:const EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                bottom: 36+ kDefaultPadding,
              ),
              alignment: Alignment.center,
              height: size.height * 0.2 - 27,
              decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(46),
                    bottomLeft: Radius.circular(46),

                  )),
              child: Row(
                children: [
                  Text("Hi Digi Green",
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  // for image....
                  const Icon(Icons.animation,size: 90,)
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    height: 54,
                    margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 10),
                              blurRadius: 50,
                              color: kPrimaryColor.withOpacity(0.23))
                        ]),
                    child: Row(
                      children: [
                        Expanded(
                          child:TextField(
                            onChanged: (value){ },
                            decoration: InputDecoration(
                              hintText: "search",
                              hintStyle: TextStyle(
                                fontSize: 20,
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              // suffixIcon: const Icon(Icons.search,size: 30,)
                            ),
                          ),
                        ),
                        const Icon(Icons.search,size: 27,)
                      ],
                    )
                )),
          ],
        ),
      );
  }
}
