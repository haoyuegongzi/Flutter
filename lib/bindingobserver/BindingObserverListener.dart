import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => BindingObserverListener();
}

class BindingObserverListener extends State<MyApp> with WidgetsBindingObserver {

  // 应用状态
  String _status = "App is running";
  bool checkStatus = false;

  @override
  void initState() {
    super.initState();
    // 添加观察者
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // 移除观察者
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // 监听应用生命周期状态变化
    if (state == AppLifecycleState.paused) {
      setState(() {
        _status = "App is paused";
      });
    } else if (state == AppLifecycleState.resumed) {
      setState(() {
        _status = "App is resumed";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('WidgetsBindingObserver Example')),
        body: Center(
          child: Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(_status),
               Checkbox(
                  value: checkStatus,
                  onChanged: (isCheck) {
                    print("Checkbox check status, isCheck = $isCheck");
                    setState(() {
                      checkStatus = isCheck ?? false;
                      print("Checkbox check status, checkStatus = $checkStatus");
                    });
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }

}