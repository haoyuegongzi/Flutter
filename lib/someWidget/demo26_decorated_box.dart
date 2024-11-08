import 'package:flutter/material.dart';

main() {
  runApp(const Demo26DecoratedBox());
}

class Demo26DecoratedBox extends StatelessWidget {
  const Demo26DecoratedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const RadialGradient(
                colors: [Colors.red, Colors.green, Colors.blue]),
            boxShadow: const [
              BoxShadow(
                  color: Colors.blueGrey,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 5.0,
                  spreadRadius: 10.0)
            ]),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 48.0),
          // child: Text(
          //   "BoxDecoration",
          //   style: TextStyle(color: Colors.white),
          //   textDirection: TextDirection.ltr,// 这里，这个属性配置不可少。
          // ),
          child: Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: "Flutter 中文开发网: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              TextSpan(
                  text: "https://flutterchina.club",
                  style: TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.w400))
            ]),
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
    );
  }
}
