import 'package:flutter/material.dart';

class SearchPageByName extends StatefulWidget {
  const SearchPageByName({super.key});

  @override
  State<SearchPageByName> createState() =>  SearchFunction();
}

class SearchFunction extends State<SearchPageByName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "搜索功能", style: TextStyle(
            fontSize: 16,
            color: Colors.pink
          ),
        ),
      ),

      body: const Center(
        child: Text(
          "这里来做搜索的功能", style: TextStyle(
            fontSize: 14,
            color: Colors.pink
        ),),
      ),
    );
  }
}







































