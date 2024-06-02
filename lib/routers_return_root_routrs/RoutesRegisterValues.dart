import 'package:flutter/material.dart';
import 'package:learnflutterdemo/routers_return_root_routrs/RootRoutrsHomePage.dart';

class RoutesRegisterValues extends StatefulWidget {
  final Map valuesRoute;

  const RoutesRegisterValues({super.key, required this.valuesRoute});

  @override
  State<RoutesRegisterValues> createState() {
    return ValuesWidget();
  }
}

class ValuesWidget extends State<RoutesRegisterValues> {

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
            // 比如我们从 RootRoutrsHomePage 转到 registerFirst 页面，然后从 registerFirst 页面跳转到 registerSecond 页面，
            // 然后从 registerSecond 跳转到 registerThird 页面。这个时候我们想的是 registerThird 注册成功后返回到
            // RootRoutrsHomePage。 这个时候就用到了返回到根路由的方法：
            Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) {
                          return const RootRoutrsHomePage();
                      }
                    ),
            (route) => false
            );
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















