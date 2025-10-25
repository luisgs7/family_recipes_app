import 'package:flutter/material.dart';

class RecipeStep extends StatelessWidget {
  final String title;
  final String step;
  const RecipeStep({super.key, required this.title, required this.step});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.1, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: width * 0.1, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            step,
            style: TextStyle(fontSize: 17),
          )
        ],
      ),
    );
  }
}
