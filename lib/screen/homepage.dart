import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text('This is Homepage', style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25,
            color: Colors.black
          ),),
        )
      ],
    );
  }
}