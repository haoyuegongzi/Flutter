import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() =>  SearchFunction();
}

class SearchFunction extends State<SearchPage> {
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







































