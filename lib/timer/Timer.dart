
import 'package:flutter/material.dart';

main() {
  runApp(TimerWidget());
}

class TimerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimerFulWidget(title: "Flutter timer 倒计时")
    );
  }
}

class TimerFulWidget extends StatefulWidget {
  String title;
  TimerFulWidget({super.key, required this.title});

  // @override
  // State<StatefulWidget> createState() {
  //   return TimerImplWidget();
  // }

  @override
  State<StatefulWidget> createState() => TimerImplWidget();
}

class TimerImplWidget extends State<StatefulWidget> {
  int count = 0;
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("已经点击的次数：$count"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pressedButton,
        tooltip: "点击操作",
        child: const Icon(Icons.add),
      ),

    );
  }
  
  void pressedButton() {
    setState(() {
      count++;
    });
  }
}











