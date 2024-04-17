
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
        // body: const ButtonWidthAndHeight(),
        // body: const WrapperWidget(),
        // body: const RadiusButton(),
        body: const CircleButton(),
      ),
    )
  );
}


class ButtonWidthAndHeight extends StatelessWidget {
  const ButtonWidthAndHeight({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ElevatedButton(
      // child: TextButton(
      // child: OutlinedButton(
      // child: IconButton(
        onPressed: () {

        },
        style: ButtonStyle(
          // 设置View的背景色
          backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
          // 设置 文字颜色
          foregroundColor: MaterialStateProperty.all(Colors.lightGreen)
        ),
        // icon: const Icon(Icons.ad_units),
        child: const Text(
            "通过ElevatedButton的父组件SizedBox来控制ElevatedButton的宽高"
        ),
      ),
    );
  }

}


class WrapperWidget extends StatelessWidget {
  const WrapperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            height: 60,
            margin: const EdgeInsets.all(10),
            child: ElevatedButton(
              child: const Text('自适应按钮'),
              onPressed: () {
                print("自适应按钮");
              },
            ),
          ),
        )
      ],
    );
  }
}


class RadiusButton extends StatelessWidget {
  const RadiusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor:MaterialStateProperty.all(Colors.blue),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(20),
          shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            )
          ),
        ),
        onPressed: () {
          print("圆角按钮");
        },
        child: const Text("圆角按钮")
    );
  }
}

class CircleButton extends StatelessWidget {
  const CircleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(20),
          shape: MaterialStateProperty.all(
      const CircleBorder(
              side: BorderSide(
                color: Colors.white
              )
            ),
          )
        ),
        onPressed: () {
          print("圆形按钮");
        },
        child: const Text('圆形按钮')),
    );
  }
}

