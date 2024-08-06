import 'package:flutter/material.dart';

//i am model, i tell the data-structure of category, or structure of our categories 

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
    });

  final String id;
  final String title;
  final Color color;
}
