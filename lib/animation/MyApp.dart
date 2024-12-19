import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: AnimatedBox());
  }
}
class AnimatedBox extends StatefulWidget {
  const AnimatedBox({super.key});

  @override
  _AnimatedBoxState createState() => _AnimatedBoxState();
}
class _AnimatedBoxState extends State<AnimatedBox> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 300.0).animate(_controller);
    _controller.forward(); // 启动动画
  }
  @override
  void dispose() {
    _controller.dispose(); // 释放资源
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation Example')),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              width: _animation.value,
              height: _animation.value,
              color: Colors.blue,
              child: const Visibility(
                visible: true,
                child: Text("asdfghjghnhgfszdbn")
              ),
            );
          },
        ),
      ),
    );
  }
}