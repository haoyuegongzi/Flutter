import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const StreamLessWidget());
}

class StreamLessWidget extends StatelessWidget {
  const StreamLessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamFullWidget(),
    );
  }
}

class StreamFullWidget extends StatefulWidget {
  const StreamFullWidget({super.key});

  @override
  State<StatefulWidget> createState() => StreamFullImplWidget();
}

class StreamFullImplWidget extends State<StreamFullWidget> {
  int count = 0;
  var sController = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<int>(
        stream: sController.stream,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          return snapshot.data == null
              ? const Text("没有收到数据")
              : Text("收到的数据是：${snapshot.data}");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sController.sink.add(++count);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
