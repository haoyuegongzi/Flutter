import 'dart:io';

import 'package:flutter/foundation.dart';

void main() {
  createIsolate();
}

// async：标记函数为异步函数，异步函数总是返回一个 Future。
void createIsolate() async {
  var str = "Flutter封装完成的，可以创建 Isolate进程的对象";
  // await：等待 Future 完成并获取结果，必须在 async 函数内使用。
  var result = await compute((message) => {
    excuteBackgroundTask(str)
  }, str);

  print("Flutter封装成的方式创建的Isolate进程的执行结果 result：$result");
}

String excuteBackgroundTask(String str) {
  print("[Flutter package isolate] child isolate start");
  sleep(const Duration(seconds: 3));
  print("[Flutter package isolate] child isolate over");
  return "[Flutter package isolate] child isolate complete: $str";
}








