import 'package:flutter/material.dart';

class Drink extends StatelessWidget {
  const Drink({super.key, required this.image, required this.name, required this.title});

  final String image;
  final String name;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Card(
            elevation: 3,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: Colors.white,
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                vertical: 70,
                horizontal: 3,
              ),
              child: Row(),
            ),
          ),
        ),

        Positioned(
          top: -10,
          bottom: 45,
          left: 20,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 70,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade900,
                      blurRadius: 30,
                      spreadRadius: 3,
                    ),
                  ],
                ),
              ),

              Image.asset(image, fit: BoxFit.contain),
            ],
          ),
        ),

        Positioned(
          top: 70,
          bottom: 0,
          right: 90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),

        Positioned(
          top: 70,
          bottom: 0,
          right: 50,
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              border: Border.all(
                // width: 2,
                color: Colors.black45,
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_forward, size: 19, color: Colors.black54),
          ),
        ),
      ],
    );
  }
}
