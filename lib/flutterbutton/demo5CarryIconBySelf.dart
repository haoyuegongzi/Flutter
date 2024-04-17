import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "文本按钮",
            style: TextStyle(
                fontSize: 24,
                color: Colors.deepPurple,
                fontStyle: FontStyle.italic,
                fontFamily: "fontFamily啥作用的属性？"
            ),
          ),
        ),
        body: const AllkindsOfButton(),
      ),
    )
  );
}

// 无论是 ElevatedButton、TextButton，还是OutlinedButton、IconButton，他们都自带一个Icon的构造函数，
// 通过它可以轻松创建带图标的按钮
class AllkindsOfButton extends StatelessWidget {
  const AllkindsOfButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      verticalDirection: VerticalDirection.down,
      children: [
        ElevatedButton.icon(
          icon: const Icon(Icons.send),
          label: const Text("发送"),
          onPressed: () {
            
          },
        ),
        TextButton.icon(
          onPressed: () {

          },
          icon: const Icon(Icons.add),
          label: const Text(
          "TextButton文本按钮"
          )
        ),
        OutlinedButton.icon(
          onPressed: () {

          },
          label: const Text(
              "OutlinedButton边框按钮"
          ),
          icon: const Icon(Icons.info),
        ),
        IconButton(
          onPressed: () {
          
          },
          icon: const Icon(
              Icons.access_time
          )
        )
      ],
    );
  }

}







