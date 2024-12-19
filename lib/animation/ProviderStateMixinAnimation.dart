
import 'package:flutter/material.dart';

main() {
  // runApp(const SingleTickerProviderStateMixinAnimation());
  runApp(const TickerProviderStateMixinAnimation());

}

class SingleTickerProviderStateMixinAnimation extends StatelessWidget {
  const SingleTickerProviderStateMixinAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return const MySingleAnimation();
  }
}

class MySingleAnimation extends StatefulWidget {
  const MySingleAnimation({super.key});

  @override
  MySingleAnimationState createState() => MySingleAnimationState();
}

class MySingleAnimationState extends State<MySingleAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: _controller.value * 100,
          height: _controller.value * 100,
          color: Colors.blue,
        );
      },
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////

class TickerProviderStateMixinAnimation extends StatelessWidget {
  const TickerProviderStateMixinAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyMultipleAnimation();
  }
}

class MyMultipleAnimation extends StatefulWidget {
  const MyMultipleAnimation({super.key});

  @override
  MyMultipleAnimationState createState() => MyMultipleAnimationState();
}

class MyMultipleAnimationState extends State<MyMultipleAnimation> with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
      // 下面两个参数用于指定动画的起始值startValue和终值endValue
      lowerBound: 0.1,
      upperBound: 1.0
    )..repeat(reverse: true);
    _controller2 = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
      // 下面两个参数用于指定动画的起始值startValue和终值endValue
      lowerBound: 0.1,
      upperBound: 1.0
    )..repeat(reverse: true);
  }
  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _controller1,
          builder: (context, child) {
            return Container(
              width: _controller1.value * 100,
              height: _controller1.value * 100,
              color: Colors.red,
            );
          },
        ),
        AnimatedBuilder(
          animation: _controller2,
          builder: (context, child) {
            return Container(
              width: _controller2.value * 50,
              height: _controller2.value * 50,
              color: Colors.green,
            );
          },
        ),
      ],
    );
  }
}