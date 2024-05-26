import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() =>  SearchFunction();
}

class SearchFunction extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "商品分类", style: TextStyle(
            fontSize: 16,
            color: Colors.pink
          ),
        ),
      ),

      body: const Center(
        child: Text(
          "这里来做商品分类的功能", style: TextStyle(
            fontSize: 14,
            color: Colors.pink
        ),),
      ),
    );
  }
}







































