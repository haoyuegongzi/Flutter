import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learnflutterdemo/multi-threads/HarmonyBean.dart';

void main() {
  runApp(const FutureBuilderLessWidget());
}

class FutureBuilderLessWidget extends StatelessWidget {
  const FutureBuilderLessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilderFullWidget(),
    );
  }
}

class FutureBuilderFullWidget extends StatefulWidget {
  const FutureBuilderFullWidget({super.key});

  @override
  State<StatefulWidget> createState() => FutureBuilderFullWidgetImpl();
}

class FutureBuilderFullWidgetImpl extends State<FutureBuilderFullWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
            "FutureBuilder模式下的状态管理",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: FutureBuilder<dynamic>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {// 数据请求中
            return const Center(child: CircularProgressIndicator(),);
          } else if (snapshot.hasError) {// 出现Error
            return Text("Error: ${snapshot.error}");
          } else {
            return Text("请求到的数据是: \n${snapshot.data}");
          }
        },
      ),
    );
  }

  dynamic getData() async {
    var httpDio = Dio();
    var response = await httpDio.get("https://wanandroid.com/harmony/index/json");
    if(response.statusCode == 200) {
      HarmonyBean harmonyBean = HarmonyBean.fromJson(response.data);
      return harmonyBean.data?.tools;
    } else {
      return "请求数据失败";
    }
  }
}













