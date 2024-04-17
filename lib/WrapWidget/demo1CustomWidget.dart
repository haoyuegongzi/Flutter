import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "OutlinedButton边框按钮是什么鬼",
          style: TextStyle(
              fontSize: 24,
              color: Colors.deepPurple,
              fontStyle: FontStyle.italic,
              fontFamily: "fontFamily啥作用的属性？"),
        ),
      ),
      body: const LayoutDemo2(),
    ),
  ));
}

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button("第一集", onPressed: () {});
  }
}

class Button extends StatelessWidget {
  String text;
  void Function()? onPressed;

  Button(this.text, {Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(255, 236, 233, 233)),
        foregroundColor: MaterialStateProperty.all(Colors.black45),
      ),
      child: Text(text),
    );
  }
}

class LayoutDemo2 extends StatelessWidget {
  const LayoutDemo2({Key? key}) : super(key: key);

  List<Button2> createListWidget() {
    List<Button2> listWidget = [];
    for(var i = 0; i < 20; i++) {
      var str = "第 ${i + 1} 集";
      listWidget.add(Button2(str, onPressed: () {}));
    }
    return listWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      // 宽度自适应、高度自适应。
      child: Wrap(
        spacing: 5,
        runSpacing: 5,
        // direction: Axis.vertical,
        // alignment:WrapAlignment.start,
        // runAlignment: WrapAlignment.center,
        children: createListWidget(),
      ),
    );
  }
}

class Button2 extends StatelessWidget {
  String text;
  void Function()? onPressed;

  Button2(this.text, {Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(255, 236, 233, 233)),
        foregroundColor: MaterialStateProperty.all(Colors.black45),
      ),
      child: Text(text),
    );
  }
}
