
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {

  final String title;

  const ItemCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Center(child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(title, style: Theme
              .of(context)
              .textTheme
              .bodyLarge)
      ),),
    );
  }

}