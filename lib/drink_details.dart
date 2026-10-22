import 'package:coffe_app/model.dart';
import 'package:coffe_app/widgets/qty_widget.dart';
import 'package:coffe_app/widgets/toggle_widget.dart';
import 'package:flutter/material.dart';

class DrinkDetails extends StatefulWidget {
  const DrinkDetails({super.key});

  @override
  State<DrinkDetails> createState() => _DrinkDetailsState();
}

class _DrinkDetailsState extends State<DrinkDetails> {
  final PageController _controller = PageController(viewportFraction: 0.5);
  double _currntPage = 0;
  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        _currntPage = _controller.page ?? 1;
      });
    });
    super.initState();
  }


  ///
  List icons=[
    Icons.local_drink,
    Icons.local_drink_outlined,
    Icons.local_drink_rounded,
    Icons.arrow_forward,
  ];

  List<String>  types=[
    "Small",
    "Medium",
    "Large",
    "More",
  ];
  
  int selectedIndex = 0;
  final drinks = DrinkModel.drinks;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          ///1 widget
          Positioned(
            top: 80,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(drinks[_currntPage.round()].name,style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),),
                    Text(drinks[_currntPage.round()].title),
                  ],
                ),

                Text(drinks[_currntPage.round()].price,style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
              ],
            )
            ),


          ///2 widget
          PageView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: drinks.length,
            itemBuilder: (context, index) {
              final scale = 1 - (_currntPage - index).abs() * 1;
              final translateY = (_currntPage - index).abs() * 400;
              return Transform.translate(
                offset: Offset(translateY, 0),
                child: Transform.scale(
                  scale: scale.clamp(0.5, 1.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 240,
                            child: Image.asset("assets/drinks/shadow.png"),
                            /*Container(
                              width: 70,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black87,
                                    blurRadius: 80,
                                    spreadRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                           */
                          ),


                          Image.asset(
                            drinks[index].image,
                            height: 900,
                            fit: BoxFit.contain,
                            cacheWidth: 500, // يقلل استهلاك الذاكرة والمعالجة
                          ),
                          
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        
          ///multi selection
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index){
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color:selectedIndex== index ? Colors.white: Colors.black87,
                                               
                                ),
                                color: selectedIndex== index ? Colors.orange: Colors.white
                                
                              ),
                              child: Icon(icons[index],color:selectedIndex== index ? Colors.white: Colors.black54,),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(types[index])
                          ],
                        ),
                      );
                    }),
                  ),
                
                SizedBox(
                  height: 30,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ToggleWidget(),
                    SizedBox(width: 20,),
                    Expanded(child: QtyWidget()),
                  ],
                ),

                
                ],
              ),
            ),
          )

          ///switcher
          
          
        ],
      ),
    );
  }
}
