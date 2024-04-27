// aspectRatio: 这个属性 表示宽高比的参数，同时也是一个组件AspectRatio，最终可能不会根据这个值去布局，具体则要看综合因素，
// 外层是否允许按照这种比率进行布局，这只是一个参考值；
// AspectRatio首先会在布局限制条件允许的范围内尽可能的扩展，widget的高度是由宽度和比率决定的，类似于BoxFit中的contain，
// 按照固定比率去尽量占满区域。如果在满足所有限制条件过后无法找到一个可行的尺寸，AspectRatio最终将会去优先适应布局限制条
// 件，而忽略所设置的比率。
// 这个参数，最早，我们在 demo14GridView.dart中就见过。
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Container组件与Align组件的搭配",
          style: TextStyle(
              fontSize: 24,
              color: Colors.deepPurple,
              fontStyle: FontStyle.italic,
              fontFamily: "fontFamily啥作用的属性？"),
        ),
      ),
      body: const AspectRatioWidget(),
    ),
  ));
}

class AspectRatioWidget extends StatelessWidget {
  const AspectRatioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      // 下面这种写法表示：宽度是高度的3被，宽高比3:1
      // aspectRatio: 3/1,
      // 这种写法跟上面的写法是一样的。
      // aspectRatio:3,
      aspectRatio: 0.8,
      child: Container(
        color: Colors.blueAccent,
      ),
    );
  }
}
