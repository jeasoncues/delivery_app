import 'package:flutter/material.dart';

class CardOfert extends StatefulWidget {
  const CardOfert({Key key}) : super(key: key);

  @override
  State<CardOfert> createState() => _CardOfertState();
}

class _CardOfertState extends State<CardOfert> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: PageView.builder(
          itemCount: 5,
          itemBuilder: (context, position) {
            return _cardItem(position); // cards imagenes
          }),
    );
  }

  Widget _cardItem(int index) {
    return Container(
      height: 220,
      margin: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: index.isEven
              ? Color(0xFFE70D32)
              : Color.fromRGBO(231, 13, 50, 0.09),
          image: const DecorationImage(
              fit: BoxFit.cover, image: AssetImage("assets/img/burguer2.png"))),
    );
  }
}
