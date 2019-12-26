import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard({@required this.color, this.cardChild});

  final Color color;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0), color: color),
    );
  }
}

class IconContent extends StatelessWidget {
  IconContent({@required this.icons, this.label, this.textColor});

  final IconData icons;
  final String label;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icons,
          color: Color(0xFFFEFEFE),
          size: 100,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            letterSpacing: 2.0,
            color: textColor,
          ),
        )
      ],
    );
  }
}
