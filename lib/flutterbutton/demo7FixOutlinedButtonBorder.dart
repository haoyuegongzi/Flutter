
import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "控制按钮的宽高",
            style: TextStyle(
                fontSize: 24,
                color: Colors.deepPurple,
                fontStyle: FontStyle.italic,
                fontFamily: "fontFamily啥作用的属性？"
            ),
          ),
        ),
        body: const FixBorderWidget(),
        // body: const FixCircleWidget(),
      ),
    )
  );
}

class FixBorderWidget extends StatelessWidget {
  const FixBorderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,//想对父布局的位置
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(20),
          height: 50,
          child: OutlinedButton(
            style: ButtonStyle(
              // 控制按钮文本颜色
              foregroundColor: MaterialStateProperty.all(Colors.lightGreen),
              side: MaterialStateProperty.all(
                  const BorderSide(width: 1, color: Colors.red))),
            onPressed: () {

            },
            child: const Text("注册 配置边框")),
        ),
      ],
    );
  }
}

class FixCircleWidget extends StatelessWidget {
  const FixCircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(20),
            height: 50,
            child: IconButton(
                onPressed: () {
                  print("Icon按钮又是啥？");
                },
                icon: const Icon(
                    Icons.account_circle
                )
            ),
          ),
        )
      ],
    );
  }
}












