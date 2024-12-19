import 'package:flutter/material.dart';

main() {
  runApp(const TweenAnimationApp());
}

class TweenAnimationApp extends StatelessWidget {
  const TweenAnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TweenAnimationFull(),
    );
  }
}

class TweenAnimationFull extends StatefulWidget {
  const TweenAnimationFull({super.key});

  @override
  State<StatefulWidget> createState() => TweenAnimationImpl();
}

class TweenAnimationImpl extends State<TweenAnimationFull> {

  double _size = 100.0; // 初始大小

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tween Animation Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 使用 TweenAnimationBuilder
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 100.0, end: _size), // 定义 Tween
              duration: const Duration(seconds: 1),
              builder: (context, size, child) {
                return Container(
                  width: size,
                  height: size,
                  color: Colors.blue,
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 切换大小
                setState(() {
                  _size = _size == 100.0 ? 200.0 : 100.0;
                });
              },
              child: const Text('Animate'),
            ),
          ],
        ),
      ),
    );
  }
}