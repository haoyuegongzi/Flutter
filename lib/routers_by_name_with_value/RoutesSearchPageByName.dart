import 'package:flutter/material.dart';

class RoutesSearchPageByName extends StatefulWidget {
  const RoutesSearchPageByName({super.key});

  @override
  State<RoutesSearchPageByName> createState() =>  SearchFunction();
}

class SearchFunction extends State<RoutesSearchPageByName> {
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







































