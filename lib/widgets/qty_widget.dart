import 'package:flutter/material.dart';

class QtyWidget extends StatefulWidget {
  const QtyWidget({super.key});

  @override
  State<QtyWidget> createState() => _QtyWidgetState();
}

class _QtyWidgetState extends State<QtyWidget> {
  int number = 1;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(5)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton( onPressed: () { 
              setState(() {
                number++;
              });
             }, icon: Icon(Icons.add,size: 30,)),
            Text(number.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
            IconButton( onPressed: () { 
              setState(() {
                if(number > 1){
                  number--;
                }
              });
             }, icon: Icon(Icons.remove,size: 30,)),
          ],
        ),
      ),
    );
  }
}