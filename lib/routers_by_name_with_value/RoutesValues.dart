import 'package:flutter/material.dart';

class RoutesValues extends StatefulWidget {
  final Map valuesRoute;

  const RoutesValues({super.key, required this.valuesRoute});

  @override
  State<RoutesValues> createState() {
    return ValuesWidget();
  }
}

class ValuesWidget extends State<RoutesValues> {

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
            // 下面 是返回上级路由
            //     当然，在没有特别处理的情况下Flutter自动地为我们在新的界面的左上角添加了返回上级界面的返回按钮，并实现了返回路由功能；
            Navigator.of(context).pop();
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














