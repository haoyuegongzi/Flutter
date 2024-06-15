import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// 使用Flutter的Toast，需要注意：
// 1、Flutter里面没有像Android那样的自带 Toast库，需要用到 第三方库：fluttertoast
// 2、在配置 fluttertoast库 的时候，需要注意 FlutterSDK版本 和 fluttertoast库 的版本之间的适配；
//      包括：cupertino_icons、flutter_lints 和 fluttertoast库；
// 3、fluttertoast库配置在 pubspec.yaml里面的 cupertino_icons: ^1.0.6 库后面。
main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Dialog示例",
    home: DialogWidget()));
}

class DialogWidget extends StatefulWidget {
  const DialogWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return DialogList();
  }
}

class DialogList extends State<DialogWidget> {
  int currenPosition = 0;

  // 这里，添加 async 和 await 关键字的意义：
  // 当我们需要接收 showAlertDialog() 里面，操作点击 Dialog 之后的返回值时，就需要通过这样来实现；
  // 下面就是我们添加了  async 和 await 关键字 之后，定义了一个 var result 的变量来接收 返回值；
  // 需要注意的是，这里的返回值，可能是任意值，比如，我们点击Dialog的某个显示内容/Item时的返回值；有可能是我们点“关闭按钮” 后，
  // 返回来的 ”关闭“ 信息。比如 点“关闭按钮”时，Navigator.pop(context, 'Cancle')方法返回的值；
  // 所以，在使用返回值时，需要特别注意；
  showAlertDialog() async {
    // 这里，我们在 showAlertDialog() 方法里面，
    // 定义了一个 参数result 来接收 AlertDialog 这个 Dialog 操作之后的返回值；
    var result = await showDialog(
        barrierDismissible: false, //表示点击灰色背景的时候是否消失弹出框
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
                "警告",
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black
              ),
            ),
            content: const Text(
                "您确定要删除吗?",
              style: TextStyle(
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                  color: Colors.black54
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                    "取消",
                  style: TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.normal,
                      color: Colors.black
                  ),
                ),
                onPressed: () {
                  print("取消");
                  Navigator.pop(context, 'Cancle');
                },
              ),
              TextButton(
                child: const Text(
                    "确定",
                  style: TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.normal,
                      color: Colors.redAccent
                  ),
                ),
                onPressed: () {
                  print("确定");
                  // 这里 pop() 方法的第二个入参(这里是 “OK” 和 上面的 “Cancle”)，可以看做是
                  // 点击对应的 按钮 之后，回调给 主界面的信息；他是一个 Object 对象；
                  Navigator.pop(context, "OK");
                },
              )
            ],
          );
        });
    print("AlertDialog的这里打印了啥：$result");
  }

  showSimpleDialog() async {
    // 这里，我们在 showSimpleDialog() 方法里面，
    // 定义了一个 参数result 来接收 SimpleDialog 这个 Dialog 操作之后的返回值；
    var result = await showDialog(
        barrierDismissible: true, //表示点击灰色背景的时候是否消失弹出框
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text(
                "请选择内容",
              style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.black
              ),
            ),
            children: <Widget>[
              SimpleDialogOption(
                child: const Text(
                    "Option A",
                  style: TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      color: Colors.orange
                  ),
                ),
                onPressed: () {
                  print("Option A");
                  Navigator.pop(context, "Option A");
                },
              ),
              const Divider(),
              SimpleDialogOption(
                child: const Text(
                    "Option B",
                  style: TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      color: Colors.orange
                  ),
                ),
                onPressed: () {
                  print("Option B");
                  Navigator.pop(context, "Option B");
                },
              ),
              const Divider(),
              SimpleDialogOption(
                child: const Text(
                    "Option C",
                  style: TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      color: Colors.orange
                  ),
                ),
                onPressed: () {
                  print("Option C");
                  Navigator.pop(context, "Option C");
                },
              ),
            ],
          );
        });
    print("SimpleDialog的这里打印了啥：$result");
    showToastByMsg(result);
  }

  showModelBottomSheetDialogOrPopupWindow() async {
    // 这里，我们在 showModelBottomSheetDialogOrPopupWindow() 方法里面，
    // 定义了一个 参数result 来接收 showModalBottomSheet 这个 Dialog 操作之后的返回值；
    var result = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 220,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: const Text(
                      "分享 A",
                    style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.black
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context, "分享 A");
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text(
                    "分享 B",
                    style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.black
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context, "分享 B");
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text(
                    "分享 C",
                    style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.black
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context, "分享 C");
                  },
                )
              ],
            ),
          );
        });
    print("showModelBottomSheetDialogOrPopupWindow的这里打印了啥：$result");
    showToastByMsg(result);
  }

  showToast() async {
    Fluttertoast.showToast(
      msg: "警告信息",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
      webShowClose: true,
      webPosition: "center",
    );
  }

  showToastByMsg(String msg) async {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
      webShowClose: true,
      webPosition: "center",
    );
  }

  showToast2() async {
    Fluttertoast.showToast(
      msg: "你今天真好看",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black45,
      textColor: Colors.white,
      fontSize: 16.0,
      webShowClose: true,
      webBgColor: "#00b09b",
      webPosition: "center",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Dialog 与 Toast",
              style: TextStyle(color: Colors.black, fontSize: 28),
            ),
          ),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showAlertDialog();
                print("这里是 AlertDialog 的示例");
              },
              child: const Text(
                "AlertDialog"
              ),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () {
                showSimpleDialog();
                print("这里是 SimpleDialog 的示例");
              },
              child: const Text(
                  "SimpleDialog"
              ),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () {
                showModelBottomSheetDialogOrPopupWindow();
                print("这里是Dialog 或者 PopuWindow 的示例");
              },
              child: const Text(
                  "BottomSheetDialogOrPopuWindow"
              ),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () {
                showToast();
                print("这里是 showToast 的示例");
              },
              child: const Text(
                  "showToast"
              ),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () {
                // SnackBar.createAnimationController(vsync: vsync)
                // 1. 为什么要选择插件, 不选择原生呢... 因为Flutter没有我们所需的这种效果! 只有自带的snackBar!
                // 2. Fluttertoast的精华都在这里：https://www.bugcatt.com/archives/1179
                showToast2();
                print("这里是 showToast 的示例");
              },
              child: const Text(
              "showToast"
              ),
            ),
            const Divider(),
          ],
        ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(color: Colors.blue, fontSize: 18),
          unselectedLabelStyle: const TextStyle(color: Colors.black45, fontSize: 12),
          selectedIconTheme: const IconThemeData(color: Colors.blue),
          unselectedIconTheme: const IconThemeData(color: Colors.black26),
          backgroundColor: Colors.lightBlueAccent,
          // 控制Icon的尺寸大小
          iconSize: 18,
          // 下面几行是实现 底部导航栏 实现 点击选中 效果的关键；
          currentIndex: currenPosition,
          onTap: (index) {
            setState(() {
              currenPosition = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_balance, color: Colors.black26,
                ),
                label: "首页", backgroundColor: Colors.blueGrey),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_chart, color: Colors.black26,
                ),
                label: "账单", backgroundColor: Colors.blueGrey),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_alarm_sharp, color: Colors.black26,
                ),
                label: "紧急事件", backgroundColor: Colors.blueGrey),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.ac_unit, color: Colors.black26,
                ),
                label: "冷饮", backgroundColor: Colors.blueGrey),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle, color: Colors.black26,
                ),
                label: "我的", backgroundColor: Colors.blueGrey)
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("这个浮动按钮有什么鸟用呢？");
        },
        child: const Icon(Icons.add_circle_outline),
      ),
      // 下面这个属性，用来控制 floatingActionButton 在界面上的位置。
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
