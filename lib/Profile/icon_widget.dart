import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  final Color color;

  const IconWidget({
    Key? key,
    required this.icon,
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Icon(icon, color: Colors.white,),
      );
}

class MyIcon extends StatelessWidget {
  final Color colorThem;
  final Color colorIcon;
  final IconData myIcon;

  const MyIcon({
    Key? key,
   required this.colorThem, required this.colorIcon, required this.myIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context)=> Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorThem,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Icon(
            myIcon,
            color: colorIcon,
          ),
        ),
      ],
    );
}