import 'package:flutter/material.dart';

class textComp extends StatelessWidget {
  textComp({required this.mainText, required this.descriptionText});
  String mainText;
  String descriptionText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            '$mainText',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 16,),
        Container(
          child: Text(
            '$descriptionText',
            style: TextStyle(fontSize: 16,color: Color.fromARGB(255, 139, 139, 139)),
          ),
        ),

      ],
    );
  }
}
