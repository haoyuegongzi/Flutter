import 'package:flutter/material.dart';

class ReplaceRoutesValues extends StatefulWidget {
  final Map valuesRoute;

  const ReplaceRoutesValues({super.key, required this.valuesRoute});

  @override
  State<ReplaceRoutesValues> createState() {
    return ValuesWidget();
  }
}

class ValuesWidget extends State<ReplaceRoutesValues> {

  @override
  void initState() {
    super.initState();
    print("RoutesValues--initState(): ${widget.valuesRoute}");
  }

  @override
  Widget build(BuildContext context) {
    String titleValue = widget.valuesRoute["title"];
    int aid = widget.valuesRoute["aid"];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "命名路由带参跳转传值",
          style: TextStyle(
              fontSize: 24,
              color: Colors.deepPurple,
              fontStyle: FontStyle.italic,
              fontFamily: "fontFamily啥作用的属性？"),
        ),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            // 下面是 跳转到指定界面；从 ItemHomePage 跳转到 本界面；然后通过下面的方式，
            //      跳转到 “search”路由对应的 RoutesSearchPageByName 界面；
            Navigator.of(context).pushReplacementNamed('/search');// 也叫 路由替换
            // 当然，若非是特殊要求，界面的跳转，我们还是应该按照 正常的跳转路由来实现；
          },
          child: Text(
            "上级界面传过来是是啥：\n${titleValue}，\n${aid}",
            style: const TextStyle(
                fontSize: 16,
                color: Colors.pink
            ),
          ),
        ),
      ),
    );
  }
}















