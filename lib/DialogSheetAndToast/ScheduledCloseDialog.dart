import 'dart:async';

import 'package:flutter/material.dart';

main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "自定义一个定时关闭的Dialog",
      home: ScheduledCloseWidget(),
    )
  );
}

class ScheduledCloseWidget extends StatefulWidget {
  const ScheduledCloseWidget({super.key});

  @override
  State<ScheduledCloseWidget> createState() => ScheduledClosedDialogImpl();
}

class ScheduledClosedDialogImpl extends State<ScheduledCloseWidget> {
  void showScheduledClosedDialog() {
    showDialog(
        context: context,
        builder: (builder) {
          return PopScope(
            // 配置：点击 Dialog 以外的区域，Dialog是否消失；canPop = false: 不消失；否则，消失；默认为true；
            canPop: false,
            child: ScheduledClosedDialog(
                title: '自定义的定时消失的Dialog',
                content: "自定义的定时消失的Dialog",
                closed: () { // 在 右上角 定义了一个 “ X ”的关闭按钮；
                  print("关闭");
                  Navigator.of(context).pop();
                },
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "定时关闭的Dialog",
            style: TextStyle(color: Colors.black, fontSize: 28),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsetsDirectional.all(16),
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsetsDirectional.all(16),
        color: Colors.blueGrey,
        child: InkWell(
          onTap: () {
            print('InkWell点击');
            showScheduledClosedDialog();
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            color: Colors.blue,
            child: const Text('点我'),
          ),
        ),
      ),
    );
  }
}

class ScheduledClosedDialog extends Dialog {
  String title = "";
  String content = "";
  int time = 1000;
  Function()? closed;
  ScheduledClosedDialog(
    {
      super.key,
      required this.title,
      required this.content,
      required this.closed,
      // required this.time
    }
  );

  // 一定要记得：在 自定义的 Dialog 的 build()方法中，在 returnxxxx之前，一定要调用这个方法，否则，定时消失的功能无法实现；
  // 利用这个特性， 我们 称之为 自定义Toast 更为合理；
  showScheduledClosedDialog(context/*, int time*/){
    Timer.periodic(
      Duration(milliseconds: time),
      (t) {
        print('关闭');
        Navigator.of(context).pop();
        t.cancel();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    showScheduledClosedDialog(context);
    return Material(
      type: MaterialType.transparency,
      child: Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Text(title),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: closed,// 注意这里 关闭按钮× 点击事件 onClosed 的使用方式
                          child: const Icon(Icons.close),
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(),
                Container(
                  padding: const EdgeInsets.all(10),
                  // width: double.infinity,
                  child: Text(content, textAlign: TextAlign.left),
                )
              ],
            ),
          )
      ),
    );
  }
}