import 'package:flutter/material.dart';

class SearchPageWithValue extends StatefulWidget {
  final String mTitle;

  // 在这里，this.mTitle参数，要么 添加 required 关键字 来修饰，要么就需要给它一个默认值；
  // 这里可以传 一个值，也可以传 N 个值，还可以将 N 多个值，封装成 一个对象 传过来；
  const SearchPageWithValue({super.key, required this.mTitle});

  // const SearchPageWithValue(String s, {super.key, this.mTitle = "SearchPage"});

  @override
  State<StatefulWidget> createState() => SearchFunction();
}

class SearchFunction extends State<SearchPageWithValue> {
  @override
  Widget build(BuildContext context) {
    // 这里要注意：一定要返回 Scaffold 这个Widget；
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // 我们可以通过这种方式，调用 SearchPageWithValue 中的参数；
          widget.mTitle,
          style: const TextStyle(fontSize: 16, color: Colors.pink),
        ),
      ),
      body: Center(
        // 我们可以通过这种方式，调用 SearchPageWithValue 中的参数mTitle；需要注意的是：这里的 Center、Text前面都没有 const 关键字修饰；
        // 而  SearchPageWithValue 中的参数 mTitle是从上一个界面中传过来的，因此，我们也可以在开发中通过这种方式来传值，传对象；
        child: Text(
          "${widget.mTitle}\n${widget.mTitle}\n${widget.mTitle}",
          style: const TextStyle(fontSize: 14, color: Colors.pink),
        ),
      ),
    );
  }
}
