import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "自定义Dialog",
    home: CustomDialogWidget(),
  ));
}

// 自定义Dialog的流程：
// 1、创建一个class 类，继承 Dialog；
// 2、创建 有参构造方法；
// 3、复写  Widget build(BuildContext context) 方法；
// 4、build()方法就是我们自由发挥、自定义 Dialog样式的主战场；
// 5、从上面流程看，这个跟Android的自定义View，遵循三部曲：mesure，Layout，draw一样；主战场在draw；
// 6、再在要引用自定义Dialog的类里面，创建 xxxxmethod async{}，传参进去；就可以开始使用了；
// 7、自定义Dialog，总结起来就是：在 build()方法里面 自定义布局；
class CustomDialogWidget extends StatefulWidget {
  const CustomDialogWidget({super.key});

  @override
  State<CustomDialogWidget> createState() => CustomDialogFull();
}

class CustomDialogFull extends State<CustomDialogWidget> {
  void showCustomDialog() async {
    var result = await showDialog(
      barrierDismissible: true, //表示点击灰色背景的时候是否消失弹出框
      context: context,
      builder: (context) {
        return PopScope(
          // 配置：点击 Dialog 以外的区域，Dialog是否消失；canPop = false: 不消失；否则，消失；默认为true；
          canPop: false,
          child: CustomDialog(
            title: '自定义的 Dialog',
            onClosed: () { // 在 右上角 定义了一个 “ X ”的关闭按钮；
              print("关闭");
              Navigator.of(context).pop();
            },
            content: "这里显示 Msg 信息"
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "自定义 Dialog",
            style: TextStyle(color: Colors.black, fontSize: 28),
          ),
        ),
      ),
      body: Center(
        child: OutlinedButton(
          // onPressed: () {
          //   showCustomDialog();
          // },
          // 点击按钮，触发方法调用，还可以像下面这样：
          onPressed: showCustomDialog,
          child: const Text(
          "自定义 Dialog"
          )
        ),
      ),
    );
  }
}

class CustomDialog extends Dialog {
  late String title;
  late String content;
  Function()? onClosed;

  CustomDialog(
      {super.key,
      required this.title,
      required this.onClosed,// 在 右上角 定义了一个 “ X ”的关闭按钮；
      this.content = ""});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text(title),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: onClosed,// 注意这里 关闭按钮× 点击事件 onClosed 的使用方式
                        child: const Icon(Icons.close),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              Container(
                padding: const EdgeInsets.all(10),
                // width: double.infinity,
                child: Text(content, textAlign: TextAlign.left),
              )
            ],
          ),
        )
      ),
    );
  }
}
