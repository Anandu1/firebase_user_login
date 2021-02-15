import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class SocalCard extends StatelessWidget {

  const SocalCard({
    Key key,
    this.icon,
    this.press,
  }) : super(key: key);

  final String icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double _screenwidth = MediaQuery.of(context).size.width,
        _screenheight= MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: press,
      child: Container(

        height: _screenheight*0.05,
        width: _screenwidth*0.1,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
