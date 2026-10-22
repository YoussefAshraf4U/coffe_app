import 'package:flutter/material.dart';

class ToggleWidget extends StatefulWidget {
  const ToggleWidget({super.key});

  @override
  State<ToggleWidget> createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {

  bool isIced = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.grey[400],
      ),
      child: Row(
        children: [
          _buildToggleSelection("Iced",isIced),
          _buildToggleSelection("Hot",!isIced),

        ],
      ),
    );
  }

  Widget _buildToggleSelection(String label, bool selected) {
  return GestureDetector(
    onTap: () {
      setState((){
      isIced = label == "Iced";
      });
    },
    child: AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve:Curves.easeIn,
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: selected ? Colors.white : Colors.grey[400],
      ),
      child: Padding(padding: const EdgeInsets.all(10), child: Text(label,style: TextStyle(
        color: selected ? Colors.black : Colors.white,
        fontWeight: FontWeight.bold,
      ),)),
    ),
  );
}


}

